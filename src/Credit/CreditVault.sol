// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {INativeTreasuryV2} from "../interfaces/INativeTreasury.sol";
import {ICreditVault} from "../interfaces/ICreditVault.sol";
import {CreditLpToken} from "./CreditLpToken.sol";
import {Comptroller} from "../Compound/Comptroller.sol";
import {CreditVaultStorage} from "../storage/CreditVaultStorage.sol";
import {CreditVaultSignatureCheck} from "./CreditVaultSignatureCheck.sol";
import {CreditVaultLogic} from "../libraries/CreditVaultLogic.sol";

/// @title Holds all the assets and positions of the RFQ providers, and provides allowance to NativeRfqPool to power the swap
/// @author Native
/// @notice CreditVault is called by NativeRfqPool to update positions, by traders to settle and liquidate, by admin to support new markets and update positions
/// @notice The "traders" here are referring to the RFQ providers, not the swappers
/// @dev CreditVaultSignatureCheck(contract) and CreditVaultLogic(library) are extracted to different contract addresses to reduce the contract size of CreditVault
/// @dev CreditVault inherits from Comptroller. The difference from Compound is that CreditVault is the address that holds the asset and gives allowance to NativeRfqPool to power the swap
contract CreditVault is Comptroller, INativeTreasuryV2, UUPSUpgradeable, ICreditVault, CreditVaultStorage {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function getImplementation() public view returns (address) {
        return _getImplementation();
    }

    /// @inheritdoc UUPSUpgradeable
    function _authorizeUpgrade(address newImplementation) internal view override onlyAdmin {
        CreditVault(newImplementation).isComptroller();
    }

    function initialize(
        address aquaVaultSignatureCheck_
    ) public initializer ensureNonZeroAddress(aquaVaultSignatureCheck_) {
        __Comptroller_init(msg.sender);
        __UUPSUpgradeable_init();
        aquaVaultSignatureCheck = CreditVaultSignatureCheck(aquaVaultSignatureCheck_);
        lastEpochUpdateTimestamp = block.timestamp;
        maxAssets = 10;
    }

    modifier onlyAdmin() {
        if (msg.sender != admin) {
            revert CallerNotAdmin();
        }
        _;
    }

    /// @notice Separate the address of trader signer and settlement wallet as the frequency of the 2 operations is very different and trader could have different security setup for 2 addresses
    modifier onlyTraderOrSettler(address trader) {
        // succeed condition
        // isTraders[msg.sender] || (isTraders[trader] && msg.sender == traderSettlers[trader])
        if (!isTraders[msg.sender] && !(isTraders[trader] && msg.sender == traderSettlers[trader])) {
            revert CallerNotTraderSettler();
        }
        _;
    }

    modifier onlyLiquidator() {
        if (!isLiquidators[msg.sender]) {
            revert CallerNotLiquidator();
        }
        _;
    }

    modifier ensureNonZeroAddress(address input) {
        if (input == address(0)) revert ZeroError();
        _;
    }

    /// @notice Called by NativeRfqPool to update positions and LP token borrow values
    /// @dev Can only be called by NativeRfqPool, and it's called after the swap is executed (signature verified)
    /// @dev Before and after the swap, the LP token exchange should not change. The amount of cash increases should cancel out the amount update of `netSwapBorrow` in LP token contract
    /// @param trader The address of the RFQ provider who is signing the quote and on which the positions is accounted
    /// @param sellerToken The address of the token that the swapper is selling, i.e. tokenIn, baseToken
    /// @param amountIn The amount of the token that the swapper is selling
    /// @param buyerToken The address of the token that the swapper is buying, i.e. tokenOut, quoteToken
    /// @param amountOut The amount of the token that the swapper is buying
    function nativeTreasuryCallback(
        address trader,
        address sellerToken,
        int256 amountIn,
        address buyerToken,
        int256 amountOut
    ) external {
        if (msg.sender != nativePool) {
            revert CallerNotNativePool();
        }

        CreditVaultLogic.swapCallback(trader, sellerToken, amountIn, buyerToken, amountOut, lpTokens, positions);
    }

    /// @notice Called by CreditLpToken to transfer the underlying asset to recipient
    /// @dev Different from Compound, Native Credit needs this function because the underlying asset does not stay in LP token contract, but here in CreditVault
    /// @param to The address of the recipient
    /// @param amount The amount of the underlying asset to transfer
    function pay(address to, uint amount) external {
        if (!(markets[msg.sender].isListed)) {
            revert CallerNotLpToken();
        }
        CreditVaultLogic.pay(to, amount);
    }

    /** admin related functions */

    /// @notice Called by admin to set new admin
    /// @param newAdmin The address of the new admin
    function setPendingAdmin(address newAdmin) external onlyAdmin ensureNonZeroAddress(newAdmin) {
        pendingAdmin = newAdmin;
    }

    /// @notice Called by pendingAdmin to accept the admin role
    function acceptAdmin() external {
        if (msg.sender != pendingAdmin) {
            revert CallerNotPendingAdmin();
        }
        admin = pendingAdmin;
    }

    /// @notice Called by admin to set new native pool
    /// @param newNativePool The address of the new native pool
    function setNativePool(address newNativePool) external onlyAdmin ensureNonZeroAddress(newNativePool) {
        nativePool = newNativePool;
    }

    /// @notice Called by admin to set new aquaVaultSignatureCheck
    /// @param newSignatureCheck The address of the new aquaVaultSignatureCheck
    function setSignatureCheck(address newSignatureCheck) external onlyAdmin ensureNonZeroAddress(newSignatureCheck) {
        aquaVaultSignatureCheck = CreditVaultSignatureCheck(newSignatureCheck);
    }

    /// @notice Called by admin to provide allowance to native pool to power the swap
    /// @param tokens The array of token and amount to approve
    function setAllowance(TokenAmountUint[] calldata tokens) external onlyAdmin {
        CreditVaultLogic.setAllowance(tokens, nativePool);
    }

    /// @notice Called by admin to set the LP token reserve withdrawer
    /// @param _lpTokenReserveWithdrawer The address of the new LP token reserve withdrawer
    function setLpTokenReserveWithdrawer(address payable _lpTokenReserveWithdrawer) external onlyAdmin {
        lpTokenReserveWithdrawer = _lpTokenReserveWithdrawer;
    }

    /// @notice Called by admin to whitelist or blacklist a trader
    /// @param trader The address of the trader
    /// @param isTrader True to whitelist, false to blacklist
    function setTrader(
        address trader,
        bool isTrader,
        address settler,
        bool isWhitelistTrader,
        bool isLiquidator
    ) external onlyAdmin {
        isTraders[trader] = isTrader;
        traderSettlers[trader] = settler;
        isWhitelistTraders[trader] = isWhitelistTrader;
        isLiquidators[trader] = isLiquidator;
    }

    /// @notice Called by admin to set new signer
    /// @dev The signer address is passed to CreditSignatureCheck to verify the signature of Native Credit operator
    /// @param _signer The address of the new signer
    function setSigner(address _signer) external onlyAdmin ensureNonZeroAddress(_signer) {
        signer = _signer;
    }

    /// @notice Called by admin to set new epoch updater
    /// @param _epochUpdater The address of the new epoch updater
    function setEpochUpdater(address _epochUpdater) external onlyAdmin ensureNonZeroAddress(_epochUpdater) {
        epochUpdater = _epochUpdater;
    }

    /// @notice Called by admin to support new market (new LP token)
    /// @param aquaLpToken The address of the new LP token
    function supportMarket(CreditLpToken aquaLpToken) external onlyAdmin returns (uint) {
        address underlying = aquaLpToken.underlying();
        if (address(lpTokens[underlying]) != address(0) || aquaLpToken.aquaVault() != address(this))
            revert InvalidMarket();
        // Only set when mapping doesn't exist
        lpTokens[underlying] = aquaLpToken;
        return _supportMarket(aquaLpToken);
    }

    /// @notice Called by epoch updater to update the LP token borrow value
    /// @notice The fee for traders' positions are calculated off-chain and got updated periodically on-chain
    /// @dev The reason for not updating this in every swap is to reduce the gas cost
    /// @param traderPositionUpdate The array of trader position update
    /// @param lpTokenValueUpdate The array of LP token value update
    function positionEpochUpdate(
        TraderPositionUpdate[] calldata traderPositionUpdate,
        LpTokenValueUpdate[] calldata lpTokenValueUpdate
    ) external {
        if (msg.sender != epochUpdater) {
            revert CallerNotEpochUpdater();
        }
        CreditVaultLogic.positionEpochUpdate(
            traderPositionUpdate,
            lpTokenValueUpdate,
            positions,
            lpTokens,
            lastEpochUpdateTimestamp
        );
        lastEpochUpdateTimestamp = block.timestamp;
    }

    /// @notice a permissionless function to repay short positions for a trader
    /// @param repayments The array of token and amount to repay
    function repay(TokenAmountInt[] calldata repayments, address trader) external {
        CreditVaultLogic.repay(repayments, positions, trader, lpTokens);
    }

    /// @notice Called by traders to settle the positions
    /// @dev It's a permissioned function. The caller need to call off-chain API to get the signature in order to execute this function
    /// @dev Off-chain system evaluates the settlement request and trader's credit to determine whether to sign the request
    /// @param request The struct of the settlement request containing info of long and short positions to settle
    /// @param signature The signature of the settlement request
    function settle(
        SettlementRequest calldata request,
        bytes calldata signature
    ) external onlyTraderOrSettler(request.trader) {
        aquaVaultSignatureCheck.verifySettleSignature(request, signature, signer);

        CreditVaultLogic.settle(
            request.positionUpdates,
            CreditVaultLogic.TraderCreditCheckParams({
                trader: request.trader,
                recipient: request.recipient,
                isWhitelisedTrader: isWhitelistTraders[request.trader],
                oracle: oracle,
                allMarkets: allMarkets
            }),
            positions,
            lpTokens,
            markets,
            aquaCollateral
        );
    }

    /// @notice Called by traders to add collateral
    /// @dev It's a permissionless function, anyone can add collateral for any trader
    /// @dev Off-chain system will capture this event and update the trader's credit off-chain to allow the trader to quote more
    /// @param tokens The array of token and amount to add
    /// @param trader The address of the trader
    function addCollateral(TokenAmountUint[] calldata tokens, address trader) external {
        CreditVaultLogic.addCollateral(tokens, aquaCollateral, markets, trader);
    }

    /// @notice Called by traders to remove collateral
    /// @dev It's a permissioned function. The caller need to call off-chain API to get the signature in order to execute this function
    /// @dev Off-chain system evaluates the settlement request and trader's credit to determine whether to sign the request
    /// @param request The struct of the remove collateral request containing info of collateral to remove
    /// @param signature The signature of the remove collateral request
    function removeCollateral(
        RemoveCollateralRequest calldata request,
        bytes calldata signature
    ) external onlyTraderOrSettler(request.trader) {
        aquaVaultSignatureCheck.verifyRemoveCollateralSignature(request, signature, signer);

        CreditVaultLogic.removeCollateral(
            request.tokens,
            CreditVaultLogic.TraderCreditCheckParams({
                trader: request.trader,
                recipient: request.recipient,
                isWhitelisedTrader: isWhitelistTraders[request.trader],
                oracle: oracle,
                allMarkets: allMarkets
            }),
            aquaCollateral,
            markets,
            positions
        );
    }

    /// @notice Called by liquidators to liquidate the underwater positions
    /// @dev It's a permissioned function. Only a whitelist of liquidators can call this function. And the caller need to call off-chain API to get the signature
    /// @dev Off-chain system evaluates the liquidation request and trader's credit to determine whether to sign the request
    /// @param request The struct of the liquidation request containing info of long and short positions to liquidate
    /// @param signature The signature of the liquidation request
    function liquidate(LiquidationRequest calldata request, bytes calldata signature) external onlyLiquidator {
        aquaVaultSignatureCheck.verifyLiquidationSignature(request, signature, signer);

        CreditVaultLogic.liquidate(
            request.positionUpdates,
            request.claimCollaterals,
            CreditVaultLogic.TraderCreditCheckParams({
                trader: request.trader,
                recipient: request.recipient,
                isWhitelisedTrader: isWhitelistTraders[request.trader],
                oracle: oracle,
                allMarkets: allMarkets
            }),
            positions,
            lpTokens,
            markets,
            aquaCollateral
        );
    }
}
