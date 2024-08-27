// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import {CToken} from "../Compound/CToken.sol";
import {PriceOracle} from "../Compound/PriceOracle.sol";

abstract contract PullModelPriceOracle is PriceOracle {
    function updatePrices(
        address[] calldata tokens,
        bytes32[] calldata priceIds,
        bytes[] calldata data,
        address refundee
    ) external payable virtual {}
}
