// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

interface ICreditLpToken {
    error BorrowRateTooHigh();
    error CallerNotAquaVault();
    error MintFreshnessCheckFailed();
    error RedeemFreshnessCheckFailed();
    error BorrowFreshnessCheckFailed();
    error NotEnoughInventroyForRedemption();
    error BothRedeemTokensInAndRedeemAmountInNonZero();
    error BorrowCashNotAvailable();
    error Overflow();

    function mint(uint amount, address recipient) external;

    function redeem(uint redeemTokens) external returns (uint);

    function redeemUnderlying(uint redeemAmount) external;

    function repay(uint borrwAmount, uint lendingAmount) external;
}
