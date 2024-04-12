// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import "./interfaces/IPricer.sol";
import "./libraries/FullMath.sol";

contract ConstantSumPricer is IPricer {
    uint256 internal constant PERCENTAGE_DIVISOR = 100_00;

    function getAmountOut(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut,
        uint256 fee
    ) public pure override returns (uint amountOut) {
        uint256 feeBasis = FullMath.mulDivRoundingUp(amountIn, fee, PERCENTAGE_DIVISOR);
        amountOut = amountIn - feeBasis;
        require(amountOut <= reserveOut, "amountOut too large");
    }
}
