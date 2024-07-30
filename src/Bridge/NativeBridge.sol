// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Ownable2StepUpgradeable} from "@openzeppelin/contracts-upgradeable/access/Ownable2StepUpgradeable.sol";
import {PausableUpgradeable} from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import {ReentrancyGuardUpgradeable} from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import {EIP712Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol";
import {SafeERC20, IERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";
import {NativeBridgeStorage} from "..//storage/NativeBridgeStorage.sol";
import {INativeRfqPool} from "..//interfaces/INativeRfqPool.sol";
import {INativeRouter} from "../interfaces/INativeRouter.sol";
import {INativeBridge} from "../interfaces/INativeBridge.sol";
import {IWETH9} from "../interfaces/IWETH9.sol";

interface INativeLendVault {
    function positions(address settler, address token) external view returns (int256 amount);
}

/// @title NativeBridge
/// @author NativeOrg
/// @notice A cross-chain bridge contract for facilitating token transfers between different blockchains
/// @dev This contract implements the UUPS upgradeable pattern and inherits from various OpenZeppelin contracts
/// @custom:security-contact security@example.com
contract NativeBridge is
    UUPSUpgradeable,
    Ownable2StepUpgradeable,
    PausableUpgradeable,
    ReentrancyGuardUpgradeable,
    EIP712Upgradeable,
    NativeBridgeStorage,
    INativeBridge
{
    using SafeERC20 for IERC20;

    /// @notice Typehash for EIP-712 signature of refund orders
    /// @dev keccak256("Refund(address user,bytes16 quoteId)")
    bytes32 private constant REFUND_ORDER_TYPEHASH = 0x142c12c35aac893f0493cbe0da9d556a634e5befa64c3038f2df257040f7cbc9;

    /// @notice Constant used for percentage calculations
    /// @dev Represents 100% (10000 basis points)
    uint256 public constant DIVISOR = 10_000;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    /// @notice Authorizes an upgrade to a new implementation
    /// @dev Can only be called by the owner
    /// @param newImplementation Address of the new implementation contract
    function _authorizeUpgrade(address newImplementation) internal view override onlyOwner {}

    /// @notice Initializes the contract
    /// @dev Sets up initial state and initializes inherited contracts
    /// @param nativeRouter_ Address of the native router contract
    /// @param weth_ Address of the WETH contract
    /// @param nativeSigner_ Address of the native signer
    /// @param nativeLendVault_ Address of the native lending vault
    function initialize(
        address nativeRouter_,
        address weth_,
        address nativeSigner_,
        address nativeLendVault_,
        uint256 refundBuffer_
    ) public initializer {
        __UUPSUpgradeable_init();
        __Pausable_init();
        __ReentrancyGuard_init();
        __Ownable2Step_init();
        __EIP712_init("NativeBridge", "1");

        nativeRouter = nativeRouter_;
        weth = weth_;
        nativeSigner = nativeSigner_;
        nativeLendVault = nativeLendVault_;
        refundBuffer = refundBuffer_;
    }

    // *** Source chain functions ***

    /// @notice Initiates a bridge transfer
    /// @dev Can be called by a user or filler when the contract is not paused
    /// @param swapper Address of the user initiating the transfer
    /// @param input Input details of the transfer
    /// @param output Output details of the transfer
    /// @param dstRouterData Destination router data for filling the order
    /// @param externalBridgeData Data for an external bridge if Native can't fill the order
    function initiate(
        address swapper,
        Input calldata input,
        Output calldata output,
        INativeRfqPool.RFQTQuote calldata dstRouterData,
        FallbackBridgeData calldata externalBridgeData
    ) public payable nonReentrant whenNotPaused {
        // only whitelisted solver can execute for swapper
        if (msg.sender != swapper) {
            if (!isWhitelistedSolver[msg.sender]) revert NativeBridgeError(ErrorCodes.SolverNotWhitelisted);
        }
        if (msg.value > 0) {
            if (input.amount != msg.value) revert NativeBridgeError(ErrorCodes.AmountMismatch);
            if (input.token != weth) revert NativeBridgeError(ErrorCodes.TokenMismatch);
            IWETH9(weth).deposit{value: msg.value}();
            _initiate(swapper, input, output, dstRouterData, externalBridgeData);
        } else {
            uint256 balanceBefore = IERC20(input.token).balanceOf(address(this));
            IERC20(input.token).safeTransferFrom(msg.sender, address(this), input.amount);
            // enforce no fee on transfer
            if (IERC20(input.token).balanceOf(address(this)) - balanceBefore < input.amount) {
                revert NativeBridgeError(ErrorCodes.BalanceMismatch);
            }
            _initiate(swapper, input, output, dstRouterData, externalBridgeData);
        }
    }

    /// @notice Internal function to process bridge initiation
    /// @dev Handles both Native and external bridge scenarios
    /// @param swapper Address of the user initiating the transfer
    /// @param input Input details of the transfer
    /// @param output Output details of the transfer
    /// @param dstRouterData Destination router data for filling the order
    /// @param externalBridgeData Data for an external bridge if Native can't fill the order
    function _initiate(
        address swapper,
        Input memory input,
        Output calldata output,
        INativeRfqPool.RFQTQuote calldata dstRouterData,
        FallbackBridgeData calldata externalBridgeData
    ) internal {
        // @dev this scenario handles a call to an external bridge
        if (externalBridgeData.bridgeAddress != address(0)) {
            if (!isExternalBridge[externalBridgeData.bridgeAddress]) {
                revert NativeBridgeError(ErrorCodes.InvalidSettlementContract);
            }
            IERC20(input.token).forceApprove(externalBridgeData.bridgeAddress, input.amount);
            (bool success,) = (externalBridgeData.bridgeAddress).call(externalBridgeData.bridgeCalldata);
            if (!success) revert BridgeCallFail();
            emit ExternalBridge(swapper, externalBridgeData.bridgeAddress, input, output);
        } else {
            _processIntent(swapper, input, output, dstRouterData);
            emit IntentRegistered(swapper, dstRouterData.quoteId, input, output);
        }
    }

    /// @notice Allows a user to request a refund for an unfilled order
    /// @dev Can only be called after the fill deadline has passed
    /// @param quoteId The unique identifier of the order
    /// @param refundSignature Signature authorizing the refund
    function refund(bytes16 quoteId, bytes calldata refundSignature) external nonReentrant whenNotPaused {
        OrderInfo storage orderInfo = userOrder[msg.sender][quoteId];
        if (orderInfo.orderTimestamp + refundBuffer > block.timestamp) {
            revert NativeBridgeError(ErrorCodes.RefundWindowNotStarted);
        }
        if (
            !SignatureChecker.isValidSignatureNow(
                nativeSigner,
                _hashTypedDataV4(keccak256(abi.encode(REFUND_ORDER_TYPEHASH, msg.sender, quoteId))),
                refundSignature
            )
        ) {
            revert NativeBridgeError(ErrorCodes.InvalidSignature);
        }
        // also reverts for invalid order (default orderState of None)
        if (orderInfo.orderState != OrderState.Committed) revert NativeBridgeError(ErrorCodes.InvalidOrder);
        orderInfo.orderState = OrderState.Refunded;
        IERC20(orderInfo.orderInput.token).safeTransfer(msg.sender, orderInfo.orderInput.amount);
        emit Refunded(msg.sender, quoteId);
    }

    /// @notice Processes a batch of claims
    /// @dev Iterates through the provided claim data and processes each claim
    /// @param claimData Array of claim data to process
    function claimBatch(ClaimData[] calldata claimData) external nonReentrant whenNotPaused {
        for (uint256 i; i < claimData.length;) {
            _claim(claimData[i]);
            unchecked {
                ++i;
            }
        }
    }

    /// @notice Processes a single claim
    /// @dev Wrapper around the internal _claim function
    /// @param claimData The claim data to process
    function claim(ClaimData calldata claimData) external nonReentrant whenNotPaused {
        _claim(claimData);
    }

    /// @notice Internal function to process a claim
    /// @dev Validates claim data and processes the claim
    /// @param claimData The claim data to process
    function _claim(ClaimData memory claimData) internal {
        if (claimData.users.length != claimData.quoteIds.length) {
            revert NativeBridgeError(ErrorCodes.InputLengthMismatch);
        }
        uint256 totalAmount;
        uint256 fee;
        address claimToken = claimData.claimPayload.sellerToken;
        address settler = claimData.claimPayload.signer;
        for (uint256 i; i < claimData.quoteIds.length;) {
            OrderInfo memory userOrderInfo = userOrder[claimData.users[i]][claimData.quoteIds[i]];
            /// @dev order expiry is not checked here as we expect the claim payload to only be released after expiry
            if (userOrderInfo.orderState != OrderState.Committed) {
                revert NativeBridgeError(ErrorCodes.OrderAlreadyCompleted);
            }
            /**
             * @dev the claim buffer is a window from each order's fill deadline for the market maker
             * to claim their funds on the source chain without incurring a penalty
             *
             *          @dev the settler should be able to claim any time. this is guarded by native's backend api
             */
            if (msg.sender != settler) {
                // extend the timeline requirement for non settlers to claim
                if (userOrderInfo.orderTimestamp + claimBuffer > block.timestamp) {
                    revert NativeBridgeError(ErrorCodes.ClaimDeadlineNotExpired);
                }
            }

            if (userOrderInfo.orderInput.token != claimToken) revert NativeBridgeError(ErrorCodes.TokenMismatch);
            if (userOrderInfo.settler != settler) revert NativeBridgeError(ErrorCodes.SettlerMismatch);
            userOrder[claimData.users[i]][claimData.quoteIds[i]].orderState = OrderState.Completed;
            totalAmount = totalAmount + userOrderInfo.orderInput.amount;
            unchecked {
                ++i;
            }
        }
        if (msg.sender != settler) {
            fee = totalAmount * claimFeeBps / DIVISOR;
            IERC20(claimToken).safeTransfer(msg.sender, fee);
            totalAmount = totalAmount - fee;
        }
        if (claimData.claimPayload.buyerTokenAmount != 0) revert NativeBridgeError(ErrorCodes.InvalidBuyerTokenAmount);
        claimData.claimPayload.effectiveSellerTokenAmount = totalAmount;
        uint256 initialVaultBalance = IERC20(claimToken).balanceOf(nativeLendVault);
        int256 initialPosition = INativeLendVault(nativeLendVault).positions(settler, claimToken);
        IERC20(claimToken).forceApprove(nativeRouter, totalAmount);
        INativeRouter(nativeRouter).tradeRFQT(claimData.claimPayload);
        // validate the actual amount increased less fee
        totalAmount = totalAmount - (claimData.claimPayload.widgetFee.feeRate * totalAmount / DIVISOR);
        if (IERC20(claimToken).balanceOf(nativeLendVault) - initialVaultBalance < totalAmount) {
            revert NativeBridgeError(ErrorCodes.BalanceMismatch);
        }
        // validate market maker's position is correctly returned
        if (INativeLendVault(nativeLendVault).positions(settler, claimToken) - initialPosition < int256(totalAmount)) {
            revert NativeBridgeError(ErrorCodes.MMBalanceMismatch);
        }
        emit Claim(msg.sender, settler, claimToken, totalAmount, fee, claimData.quoteIds);
    }

    /// @notice Processes the intent of a bridge transfer
    /// @dev Validates the intent and creates an order
    /// @param swapper Address of the user initiating the transfer
    /// @param input Input details of the transfer
    /// @param output Output details of the transfer
    /// @param dstRouterData Destination router data for filling the order
    function _processIntent(
        address swapper,
        Input memory input,
        Output calldata output,
        INativeRfqPool.RFQTQuote calldata dstRouterData
    ) internal {
        _validateSourceIntent(swapper, input, output, dstRouterData);

        userOrder[swapper][dstRouterData.quoteId] = OrderInfo({
            orderInput: input,
            orderHash: keccak256(abi.encode(dstRouterData)),
            orderTimestamp: block.timestamp,
            settler: dstRouterData.signer,
            orderState: OrderState.Committed
        });
    }

    // *** Destination chain functions ***

    /// @notice Fills and settles an initiated order on the destination chain
    /// @dev Can be called by the filler when the contract is not paused
    /// @param dstRouterData The data sent to nativeRouter to fill the order
    function fill(INativeRfqPool.RFQTQuote calldata dstRouterData) external nonReentrant whenNotPaused {
        _fill(dstRouterData);
    }

    /// @notice Internal function to fill an order
    /// @dev Validates the order, updates state, and interacts with nativeRouter
    /// @param dstRouterData The data sent to nativeRouter to fill the order
    /// @return Address of the buyer's token and the amount received
    function _fill(INativeRfqPool.RFQTQuote memory dstRouterData) internal returns (address, uint256) {
        // validate intent on dst chain
        // reverts on validation failure
        _validateDestinationIntent(dstRouterData);

        /// @dev we assume that the quoteId is ALWAYS unique across all chains
        // we reuse the same state variable to save destination chain orders
        userOrder[dstRouterData.recipient][dstRouterData.quoteId].orderState = OrderState.Completed;

        uint256 initialRecepientBalance = dstRouterData.buyerToken == address(0)
            ? address(dstRouterData.recipient).balance
            : IERC20(dstRouterData.buyerToken).balanceOf(dstRouterData.recipient);
        // calls nativeRouter to settle
        /// no approval required due to unbalance swap expecting 0 token input
        dstRouterData.effectiveSellerTokenAmount = 0;
        INativeRouter(nativeRouter).tradeRFQT(dstRouterData);

        // This is required as tradeRFQT doesn't return amountOut
        uint256 swapOutputAmount = dstRouterData.buyerToken == address(0)
            ? address(dstRouterData.recipient).balance - initialRecepientBalance
            : IERC20(dstRouterData.buyerToken).balanceOf(dstRouterData.recipient) - initialRecepientBalance;
        if (
            swapOutputAmount
                < dstRouterData.buyerTokenAmount
                    - (dstRouterData.widgetFee.feeRate * dstRouterData.buyerTokenAmount / DIVISOR)
        ) {
            revert NativeBridgeError(ErrorCodes.AmountMismatch);
        }
        emit Filled(
            dstRouterData.recipient,
            dstRouterData.quoteId,
            Output({
                token: dstRouterData.sellerToken,
                amount: swapOutputAmount,
                recipient: dstRouterData.recipient,
                chainId: uint32(block.chainid)
            })
        );
        return (dstRouterData.buyerToken, swapOutputAmount);
    }

    /// @notice Validates the intent on the source chain
    /// @dev Checks various conditions of the transfer intent
    /// @param swapper Address of the user initiating the transfer
    /// @param input Input details of the transfer
    /// @param output Output details of the transfer
    /// @param dstRouterData Destination router data for filling the order
    function _validateSourceIntent(
        address swapper,
        Input memory input,
        Output memory output,
        INativeRfqPool.RFQTQuote memory dstRouterData
    ) internal view {
        // validation for source chain
        if (userOrder[swapper][dstRouterData.quoteId].orderState != OrderState.None) {
            revert NativeBridgeError(ErrorCodes.InvalidQuoteId);
        }
        if (input.initiateDeadline < block.timestamp) revert NativeBridgeError(ErrorCodes.InitiateDeadlineExpired);
        if (dstRouterData.deadlineTimestamp < block.timestamp) revert NativeBridgeError(ErrorCodes.FillDeadlineExpired);
        if (input.token != dstRouterData.sellerToken) revert NativeBridgeError(ErrorCodes.TokenMismatch);
        if (input.amount != dstRouterData.sellerTokenAmount) revert NativeBridgeError(ErrorCodes.AmountMismatch);
        // validation for destination chain
        if (!isDstEnabled[output.chainId]) revert DestinationPaused();
        if (output.token != dstRouterData.buyerToken) revert NativeBridgeError(ErrorCodes.TokenMismatch);
        if (output.amount < dstRouterData.buyerTokenAmount) revert NativeBridgeError(ErrorCodes.AmountMismatch);
    }

    /// @notice Validates the intent on the destination chain
    /// @dev Checks if the order has already been completed
    /// @param dstRouterData Destination router data for filling the order
    function _validateDestinationIntent(INativeRfqPool.RFQTQuote memory dstRouterData) internal view {
        // validation for destination chain
        if (userOrder[dstRouterData.recipient][dstRouterData.quoteId].orderState != OrderState.None) {
            revert NativeBridgeError(ErrorCodes.OrderAlreadyCompleted);
        }

        // the widget signature is validated in nativeRouter
    }

    // Admin functions

    /// @notice Sets a new native signer address
    /// @dev Can only be called by the contract owner
    /// @param newNativeSigner Address of the new native signer
    function setNativeSigner(address newNativeSigner) external onlyOwner {
        nativeSigner = newNativeSigner;
    }

    /// @notice Sets the pause status for a destination chain
    /// @dev Can only be called by the contract owner
    /// @param dstChainId ID of the destination chain
    /// @param enabled New pause status for the chain
    function setDstStatus(uint32 dstChainId, bool enabled) external onlyOwner {
        isDstEnabled[dstChainId] = enabled;
    }

    /// @notice Sets the claim fee in basis points
    /// @dev Can only be called by the contract owner
    /// @param newFeeBps New fee in basis points
    function setClaimFeeBps(uint256 newFeeBps) external onlyOwner {
        if (newFeeBps > DIVISOR) revert MaxClaimFee();
        claimFeeBps = newFeeBps;
    }

    /// @notice Sets the status of an external bridge address
    /// @dev Can only be called by the contract owner
    /// @param fallbackSettlementAddress Address of the external bridge
    /// @param state New state for the external bridge
    function setFallbackAddress(address fallbackSettlementAddress, bool state) external onlyOwner {
        isExternalBridge[fallbackSettlementAddress] = state;
    }

    /// @notice Sets the claim buffer time
    /// @dev Can only be called by the contract owner
    /// @param newBuffer New buffer time in seconds
    function setClaimBuffer(uint256 newBuffer) external onlyOwner {
        claimBuffer = newBuffer;
    }

    function setWhitelistedSolver(address solver, bool whitelisted) external onlyOwner {
        isWhitelistedSolver[solver] = whitelisted;
    }

    function setRefundBuffer(uint256 newRefundBuffer) external onlyOwner {
        if (newRefundBuffer == 0) revert NonZero();
        refundBuffer = newRefundBuffer;
    }

    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }

    receive() external payable {}
}
