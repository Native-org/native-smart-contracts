// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import {INativeRfqPool} from "../interfaces/INativeRfqPool.sol";

interface INativeBridge {
    enum OrderState {
        None,
        Committed,
        Completed,
        Refunded
    }

    struct FallbackBridgeData {
        address bridgeAddress;
        bytes bridgeCalldata;
    }

    struct OrderInfo {
        Input orderInput;
        bytes32 orderHash;
        uint256 orderTimestamp;
        /// @dev the market maker that provides the funds on the destination chain
        address settler;
        OrderState orderState;
    }

    struct ClaimData {
        INativeRfqPool.RFQTQuote claimPayload;
        address[] users;
        bytes16[] quoteIds;
    }

    struct Input {
        /// @dev The timestamp by which the order must be initiated
        uint32 initiateDeadline;
        /// @dev The address of the ERC20 token on the origin chain
        address token;
        /// @dev The amount of the token to be sent
        uint256 amount;
    }

    struct Output {
        /// @dev The address of the ERC20 token on the destination chain
        /// @dev address(0) used as a sentinel for the native token
        address token;
        /// @dev The amount of the token to be sent
        uint256 amount;
        /// @dev The address to receive the output tokens
        address recipient;
        /// @dev The destination chain for this output
        uint32 chainId;
    }

    enum ErrorCodes {
        None, // 0
        InvalidOrder, // 1
        InvalidSettlementContract, // 2
        InvalidSignature, // 3
        TokenMismatch, // 4
        AmountMismatch, // 5
        InitiateDeadlineExpired, // 6
        FillDeadlineExpired, // 7
        RefundWindowNotStarted, // 8
        OrderAlreadyCompleted, // 9
        InputLengthMismatch, // 10
        SettlerMismatch, // 11
        BalanceMismatch, // 12
        InvalidQuoteId, // 13
        MMBalanceMismatch, // 14
        ClaimDeadlineNotExpired, // 15
        SolverNotWhitelisted, // 16
        InvalidBuyerTokenAmount // 17

    }

    error NativeBridgeError(ErrorCodes);
    error OverwriteFail(uint256);
    error RouterSwapFail();
    error DestinationPaused();
    error BridgeCallFail();
    error MaxClaimFee();
    error NonZero();

    event IntentRegistered(address user, bytes16 quoteId, Input input, Output output);
    event Filled(address user, bytes16 quoteId, Output output);
    event Refunded(address user, bytes16 quoteId);
    event ExternalBridge(address user, address bridge, Input input, Output output);
    event Claim(address caller, address settler, address token, uint256 amount, uint256 fee, bytes16[] quoteIds);
}
