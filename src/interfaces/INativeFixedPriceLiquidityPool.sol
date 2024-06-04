// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

interface INativeFixedPriceLiquidityPool {
    error InsufficientBalanceToWithdraw(address token, uint withdrawingAmount, uint balance);

    event LPTokenMinted(address indexed sender, uint amount0, uint amount1, uint lpAmount);
    event LPTokenBurned(address indexed sender, uint amount0, uint amount1, address indexed to);

    function addLiquidity(uint amountA, uint amountB, address to, uint deadline) external returns (uint liquidity);

    function removeLiquidity(uint amountA, uint amountB, address to, uint deadline) external;
}
