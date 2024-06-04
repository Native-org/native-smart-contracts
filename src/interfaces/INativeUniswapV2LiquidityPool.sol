// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

interface INativeUniswapV2LiquidityPool {
    event LPTokenMinted(address indexed sender, uint amount0, uint amount1);
    event LPTokenBurned(address indexed sender, uint amount0, uint amount1, address indexed to);

    function addLiquidity(
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);

    function removeLiquidity(
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);

    error BalanceChangeDoesNotMatchTransferAmount(uint balanceBefore, uint balenceAfter, uint amount);

    error ConstantProductKNotMaintained(uint balance0, uint balance1, uint reserve0, uint reserve1);
}
