// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import "./ISwapCallback.sol";
import {INativeRfqPool} from "./INativeRfqPool.sol";

/// @title Router token swapping functionality
/// @notice Functions for swapping tokens via Native
interface INativeRouter is ISwapCallback {
    struct WidgetFee {
        address signer;
        address feeRecipient;
        uint256 feeRate;
    }

    event SetWidgetFeeSigner(address widgetFeeSigner);

    event WidgetFeeTransfer(
        address widgetFeeRecipient,
        uint256 widgetFeeRate,
        uint256 widgetFeeAmount,
        address widgetFeeToken
    );

    event RefundETHRecipient(address recipient, uint256 amount);

    function setWidgetFeeSigner(address _widgetFeeSigner) external;

    function setPauser(address _pauser) external;

    function setContractCallerWhitelistToggle(bool value) external;

    function setContractCallerWhitelist(address caller, bool value) external;

    /// @notice Swaps `amountIn` of one token for as much as possible of another token
    /// @dev Setting `amountIn` to 0 will cause the contract to look up its own balance,
    /// and swap the entire amount, enabling contracts to send tokens before calling this function.
    /// @param params The parameters necessary for the swap, encoded as `ExactInputParams` in calldata
    /// @return amountOut The amount of the received token
    function exactInputSingle(ExactInputParams calldata params) external payable returns (uint256 amountOut);

    function tradeRFQT(INativeRfqPool.RFQTQuote memory quote) external payable;

    struct ExactInputParams {
        bytes orders;
        address recipient;
        uint256 amountIn;
        uint256 amountOutMinimum;
        WidgetFee widgetFee;
        bytes widgetFeeSignature;
        bytes[] fallbackSwapDataArray;
    }

    struct ExactInputExecutionState {
        address sellerToken;
        address payer;
        uint256 initialEthBalance;
        uint256 initialSellertokenBalance;
        uint256 fallbackSwapDataIdx;
        uint256 amountOut;
        bool hasAlreadyPaid;
    }

    /// @notice Swaps `amountIn` of one token for as much as possible of another along the specified path
    /// @dev Setting `amountIn` to 0 will cause the contract to look up its own balance,
    /// and swap the entire amount, enabling contracts to send tokens before calling this function.
    /// @param params The parameters necessary for the multi-hop swap, encoded as `ExactInputParams` in calldata
    /// @return amountOut The amount of the received token
    function exactInput(ExactInputParams calldata params) external payable returns (uint256 amountOut);

    error ZeroAddressInput();
    error InvalidDeltaValue(int amount0Delta, int amount1Delta);
    error CallbackNotFromOrderBuyer(address caller);
    error MultipleOrdersForInputSingle();
    error MultipleFallbackDataForInputSingle();
    error InvalidWidgetFeeSignature();
    error InvalidWidgetFeeRate();
    error InvalidAmountInValue();
    error CallerNotMsgSender(address caller, address msgSender);
    error CallerNotEOAAndNotWhitelisted();
    error NotEnoughAmountOut(uint256 amountOut, uint256 amountOutMinimum);
    error OnlyOwnerOrPauserCanCall();
    error InvalidOrderBuyer(address orderBuyer);
    error InsufficientTokenToSweep();
    error InputArraysLengthMismatch();
    error UnexpectedMsgValue();
    error RfqQuoteExpired();
    error InvalidRfqPool();
}
