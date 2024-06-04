// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

interface INativePriceDecoupledLiquidityPool {
    error TokenAlreadyListed(address token);
    error InsufficientLiquidityTokenBalance(address token, uint lpTokenBalance, uint withdrawAmount);
    error InsufficientLiquidityToWithdraw(address token, uint tokenBalance, uint withdrawAmount);
    error TokenNotListed(address token);
    error BalanceChangeDoesNotMatchTransferAmount(uint balanceBefore, uint balenceAfter, uint amount);

    event ListAsset(address listedToken, address lpToken);

    event LiquidityToPoolAdded(
        address pool,
        address token,
        address liquidityProvider,
        uint depositAmount,
        uint lpTokenAmount
    );

    event LiquidityFromPoolRemoved(
        address pool,
        address token,
        address liquidityProvider,
        uint withdrawAmount,
        uint burnAmount
    );

    struct ListTokenInput {
        address token;
        string lpTokenName;
        string lpTokenSymbol;
    }

    function addLiquidity(address token, uint amount) external payable;

    function removeLiquidity(address token, uint amount) external;
}
