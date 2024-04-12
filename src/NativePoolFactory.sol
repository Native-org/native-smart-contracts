// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import "./libraries/NoDelegateCallUpgradable.sol";
import "./interfaces/INativePoolFactory.sol";
import "./Blacklistable.sol";
import {PeripheryState} from "./libraries/PeripheryState.sol";

import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import "./storage/NativePoolFactoryStorage.sol";
import {NativePool} from "./NativePool.sol";
import {NativeRfqPool} from "./NativeRfqPool.sol";

interface IPool {
    function poolFactory() external view returns (address);
    function getImplementation() external view returns (address);
}

contract NativePoolFactory is
    INativePoolFactory,
    OwnableUpgradeable,
    NoDelegateCallUpgradable,
    PausableUpgradeable,
    UUPSUpgradeable,
    NativePoolFactoryStorage,
    ReentrancyGuardUpgradeable
{
    // bytes4(keccak256("initialize((address,address,address,address,bool,bool,uint256[],address[],address[],uint256[]),address)"));
    bytes4 public constant INIT_SELECTOR = NativePool.initialize.selector;
    // bytes4(keccak256("initialize(string,address,address,address,address,address)"));
    bytes4 public constant INIT_RFQ_SELECTOR = NativeRfqPool.initialize.selector;
    // bytes4(keccak256("upgradeTo(address)"));
    bytes4 public constant UPGRADE_SELECTOR = 0x3659cfe6;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init();
        __NoDelegateCall_init();
        __Pausable_init();
        __UUPSUpgradeable_init();
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

    function getImplementation() public view returns (address) {
        return _getImplementation();
    }

    function setPauser(address _pauser) external onlyOwner {
        pauser = _pauser;
    }

    modifier onlyOwnerOrPauser() {
        if (msg.sender != owner() && msg.sender != pauser) {
            revert OnlyOwnerOrPauserCanCall();
        }
        _;
    }

    modifier nonZeroAddressInput(address addressInput) {
        if (addressInput == address(0)) {
            revert ZeroAddressInput();
        }
        _;
    }

    function pause() external onlyOwnerOrPauser {
        _pause();
    }

    function pausePools(address[] calldata _pools) external onlyOwnerOrPauser {
        for (uint i = 0; i < _pools.length; ) {
            address pool = _pools[i];
            if (!pools[pool] && !rfqPools[pool]) revert PoolNotFound(pool);

            NativePool(pool).pause();
            // skipping the overflow check to save gass
            unchecked {
                i++;
            }
        }
    }

    function unpause() external onlyOwner {
        _unpause();
    }

    function addMultiPoolTreasury(address treasury) external onlyOwner whenNotPaused {
        if (isMultiPoolTreasury[treasury]) revert AlreadyMultiPoolTreasury();
        isMultiPoolTreasury[treasury] = true;
        emit AddMultiPoolTreasury(treasury);
    }

    function removeMultiPoolTreasury(address treasury) external onlyOwner whenNotPaused {
        if (!isMultiPoolTreasury[treasury]) revert NotMultiPoolTreasury();
        isMultiPoolTreasury[treasury] = false;
        emit RemoveMultiPoolTreasury(treasury);
    }

    /// @notice Create a new pool
    /// @param poolConfig The configuration of the new pool
    /// @return pool address of the new pool
    function createNewPool(
        NewPoolConfig calldata poolConfig
    ) external override whenNotPaused nonReentrant nonZeroAddressInput(poolConfig.routerAddress) returns (address) {
        if (
            treasuryToPools[poolConfig.treasuryAddress].length != 0 && !isMultiPoolTreasury[poolConfig.treasuryAddress]
        ) {
            revert NotMultiPoolTreasuryAndBoundToOtherPool(poolConfig.treasuryAddress);
        }
        if (registry == address(0)) revert RegistryNotSet();
        address pool = address(
            new ERC1967Proxy(poolImplementation, abi.encodeWithSelector(INIT_SELECTOR, poolConfig, registry))
        );

        Blacklistable(address(pool)).updateBlacklister(poolConfig.poolOwnerAddress);
        OwnableUpgradeable(address(pool)).transferOwnership(poolConfig.poolOwnerAddress);

        pools[address(pool)] = true;
        treasuryToPools[poolConfig.treasuryAddress].push(pool);
        poolArray.push(address(pool));

        emit PoolCreated(
            poolConfig.treasuryAddress,
            poolConfig.poolOwnerAddress,
            poolConfig.signerAddress,
            address(pool),
            poolImplementation
        );
        return pool;
    }

    function upgradePools(address[] calldata _pools, address[] calldata _impls) external override onlyOwner {
        if (_pools.length != _impls.length) revert InputArrayLengthMismatch();

        for (uint256 i = 0; i < _pools.length; ) {
            _upgradePool(_pools[i], _impls[i]);

            // skipping the overflow check to save gas
            unchecked {
                i++;
            }
        }
    }

    function upgradePool(address _pool, address _impl) external override onlyOwner {
        _upgradePool(_pool, _impl);
    }

    function setPoolImplementation(address newPoolImplementation) external override onlyOwner {
        poolImplementation = newPoolImplementation;
        emit PoolImplementationSet(newPoolImplementation);
    }

    function _upgradePool(address _pool, address _impl) internal {
        if (!pools[_pool] && !rfqPools[_pool]) revert PoolNotFound(_pool);
        (bool success, ) = _pool.call(abi.encodeWithSelector(UPGRADE_SELECTOR, _impl));

        if (!success || IPool(_pool).poolFactory() != address(this) || IPool(_pool).getImplementation() != _impl)
            revert PoolUpgradeFailed();

        emit PoolUpgraded(_pool, _impl);
    }

    function setRegistry(address _registry) public onlyOwner nonZeroAddressInput(_registry) {
        registry = _registry;
        emit RegistrySet(_registry);
    }

    function getPool(address treasuryAddress) public view override returns (address[] memory) {
        return treasuryToPools[treasuryAddress];
    }

    function verifyPool(address poolAddress) public view override returns (bool) {
        return pools[poolAddress];
    }

    function isRfqPool(address poolAddress) public view returns (bool) {
        return rfqPools[poolAddress];
    }

    /// @notice Create a new RFQ pool
    /// @param rfqPoolImpl The implementation address of the RFQ pool
    /// @param name The name of the RFQ pool
    /// @param owner The owner of the RFQ pool
    /// @param signer The signer of the RFQ pool
    /// @param router The router address
    /// @param treasury The treasury address
    /// @return poolAddress address of the new RFQ pool
    function createNewRfqPool(
        address rfqPoolImpl,
        string calldata name,
        address owner,
        address signer,
        address router,
        address treasury
    ) public whenNotPaused onlyOwner returns (address) {
        address wethAddr = PeripheryState(router).WETH9();
        address pool = address(
            new ERC1967Proxy(
                rfqPoolImpl,
                abi.encodeWithSelector(INIT_RFQ_SELECTOR, name, owner, signer, router, wethAddr, treasury)
            )
        );
        rfqPools[pool] = true;
        poolArray.push(pool);
        emit RfqPoolCreated(pool, rfqPoolImpl);
        return pool;
    }
}
