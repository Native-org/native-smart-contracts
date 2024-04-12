// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/Context.sol";
import "@openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

import {NativeRfqPoolStorage} from "./storage/NativeRfqPoolStorage.sol";
import {INativeRfqPool} from "./interfaces/INativeRfqPool.sol";
import {INativeTreasuryV2} from "./interfaces/INativeTreasury.sol";
import {IWETH9} from "./interfaces/IWETH9.sol";

contract NativeRfqPool is
    INativeRfqPool,
    Initializable,
    Context,
    UUPSUpgradeable,
    EIP712Upgradeable,
    NativeRfqPoolStorage
{
    using Address for address payable;
    using SafeERC20 for IERC20;

    // This follows the existing NativePool order signature format
    // keccak256("Order(uint256 id,address signer,address buyer,address seller,address buyerToken,address sellerToken,uint256 buyerTokenAmount,uint256 sellerTokenAmount,uint256 deadlineTimestamp,address caller,bytes16 quoteId)");
    bytes32 private constant ORDER_SIGNATURE_HASH = 0xcdd3cf1659a8da07564b163a4df90f66944547e93f0bb61ba676c459a2db4e20;

    bool public constant isNativeRfqPool = true;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    receive() external payable {}

    function _authorizeUpgrade(address newImplementation) internal view override {
        if (msg.sender != poolFactory) {
            revert CallerNotFactory();
        }
        if (!NativeRfqPool(payable(newImplementation)).isNativeRfqPool()) {
            revert InvalidNewImplementation();
        }
    }

    function getImplementation() public view returns (address) {
        return _getImplementation();
    }

    function initialize(
        string memory _name,
        address _owner,
        address _signer,
        address _router,
        address _weth,
        address _treasury
    ) public initializer {
        if (
            _owner == address(0) ||
            _router == address(0) ||
            bytes(_name).length == 0 ||
            _weth == address(0) ||
            _treasury == address(0) ||
            _signer == address(0)
        ) {
            revert ZeroOrEmptyInput();
        }

        __EIP712_init("native pool", "1");

        name = _name;
        owner = _owner;
        router = _router;
        weth = _weth;
        treasury = _treasury;
        poolFactory = msg.sender;
        isSigner[_signer] = true;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert CallerNotOwner();
        }
        _;
    }

    modifier onlyRouter() {
        if (msg.sender != router) {
            revert CallerNotRouter();
        }
        _;
    }

    function setPendingOwner(address newOwner) public onlyOwner {
        pendingOwner = newOwner;
    }

    function acceptOwner() public {
        if (msg.sender != pendingOwner) {
            revert CallerNotPendingOwner();
        }
        owner = pendingOwner;
        emit OwnerSet(pendingOwner);
    }

    function setTreasury(address newTreasury) public onlyOwner {
        treasury = newTreasury;
        emit TreasurySet(newTreasury);
    }

    function tradeRFQT(RFQTQuote memory quote) external override onlyRouter {
        /// Trust assumption: the Router has transferred sellerToken.
        if (paused) {
            revert TradePaused();
        }

        address originalBuyerToken = quote.buyerToken;

        quote.buyerToken = quote.buyerToken == address(0) ? weth : quote.buyerToken;
        quote.sellerToken = quote.sellerToken == address(0) ? weth : quote.sellerToken;

        if (!verifySignature(quote)) {
            revert InvalidSignature();
        }

        _updateNonce(quote.nonce);

        uint256 buyerTokenAmount = quote.buyerTokenAmount;
        if (quote.effectiveSellerTokenAmount < quote.sellerTokenAmount) {
            buyerTokenAmount = (quote.effectiveSellerTokenAmount * quote.buyerTokenAmount) / quote.sellerTokenAmount;
        }

        emit RfqTrade(
            quote.recipient,
            quote.sellerToken,
            quote.buyerToken,
            quote.effectiveSellerTokenAmount,
            buyerTokenAmount,
            quote.quoteId,
            quote.signer
        );

        _transferFromTreasury(originalBuyerToken, quote.recipient, buyerTokenAmount);

        if (enableTreasuryCallback) {
            if (
                quote.effectiveSellerTokenAmount > uint256(type(int256).max) ||
                buyerTokenAmount > uint256(type(int256).max)
            ) {
                revert Overflow();
            }

            INativeTreasuryV2(treasury).nativeTreasuryCallback(
                quote.signer,
                quote.sellerToken,
                int(quote.effectiveSellerTokenAmount),
                quote.buyerToken,
                int(buyerTokenAmount)
            );
        }
    }

    function updateSigner(address signer, bool value) external onlyOwner {
        isSigner[signer] = value;
        emit SignerUpdated(signer, value);
    }

    function setPostTradeCallback(bool value) external onlyOwner {
        enableTreasuryCallback = value;
        emit PostTradeCallbackSet(value);
    }

    function setPause(bool value) external onlyOwner {
        paused = value;
        emit PauseSet(value);
    }

    /**
     * @dev Prevents against replay for RFQ-T. Checks that nonces are strictly increasing.
     */
    function _updateNonce(uint256 nonce) internal {
        if (nonces[nonce]) {
            revert NonceUsed();
        }
        nonces[nonce] = true;
    }

    /// @dev Helper function to transfer buyerToken from external account.
    function _transferFromTreasury(address token, address receiver, uint256 value) private {
        if (token == address(0)) {
            IERC20(weth).safeTransferFrom(treasury, address(this), value);
            IWETH9(weth).withdraw(value);
            payable(receiver).sendValue(value);
        } else {
            IERC20(token).safeTransferFrom(treasury, receiver, value);
        }
    }

    function verifySignature(RFQTQuote memory quote) internal view returns (bool) {
        if (!isSigner[quote.signer]) {
            revert InvalidSigner();
        }
        bytes32 digest = _hashTypedDataV4(
            keccak256(
                abi.encode(
                    ORDER_SIGNATURE_HASH,
                    quote.nonce,
                    quote.signer,
                    address(this),
                    quote.recipient,
                    quote.buyerToken,
                    quote.sellerToken,
                    quote.buyerTokenAmount,
                    quote.sellerTokenAmount,
                    quote.deadlineTimestamp,
                    quote.recipient,
                    quote.quoteId
                )
            )
        );

        address recoveredSigner = ECDSAUpgradeable.recover(digest, quote.signature);
        return quote.signer == recoveredSigner;
    }
}
