// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import {CToken} from "../Compound/CToken.sol";
import {AquaLpToken} from "./AquaLpToken.sol";
import {PriceOracle} from "../Compound/PriceOracle.sol";
import {SafeCast} from "@openzeppelin/contracts/utils/math/SafeCast.sol";

/// @title Chainlink price oracle aggregatir interface
/// @dev Read data from chainlink aggregator oracle
interface ChainlinkAggregator {
    function decimals() external view returns (uint8);

    function latestRoundData()
        external
        view
        returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}

interface IERC20Decimal {
    function decimals() external view returns (uint8);
}

/// @title Chainlink price oracle for Aqua
/// @author Native
/// @notice The oracle is used to get the price of a token in USD and determine the borrow and liquidation threshold
/// @notice Aqua only sets the price feed for the tokens that are open for retail users to borrow
contract ChainlinkPriceOracle is PriceOracle {
    using SafeCast for int256;

    error CallerNotOwner();
    error OraclePriceError();
    address public immutable owner;
    uint8 private constant EXPECTED_DECIMALS = 18;

    constructor() {
        owner = msg.sender;
    }

    mapping(CToken => ChainlinkAggregator) public feeds;

    /// @notice Get the underlying price of a cToken asset
    /// @param cToken The cToken to get the underlying price of
    function getUnderlyingPrice(CToken cToken) external view override returns (uint) {
        ChainlinkAggregator feed = feeds[cToken];

        (, int256 price, , uint256 updatedAt, ) = feed.latestRoundData();
        if (price <= 0 || updatedAt == 0) {
            revert OraclePriceError();
        }

        uint256 chainlinkDecimalsDelta = EXPECTED_DECIMALS - uint256(feed.decimals());

        uint256 chainlinkPrice = price.toUint256() * 10 ** chainlinkDecimalsDelta;

        uint8 tokenDecimals = IERC20Decimal(AquaLpToken(address(cToken)).underlying()).decimals();

        if (tokenDecimals < EXPECTED_DECIMALS) {
            return chainlinkPrice * (10 ** (EXPECTED_DECIMALS - tokenDecimals));
        } else if (tokenDecimals > EXPECTED_DECIMALS) {
            return chainlinkPrice / (10 ** (tokenDecimals - EXPECTED_DECIMALS));
        }

        return chainlinkPrice;
    }

    /// @notice Set the price feed for a token
    /// @param cToken The cToken to set the price feed for
    /// @param feed The price feed. cToken.underlying()/USD pair
    function setPriceFeed(CToken cToken, ChainlinkAggregator feed) external {
        if (msg.sender != owner) {
            revert CallerNotOwner();
        }
        isTokenOracleSupported[cToken] = true;
        feeds[cToken] = feed;
    }
}
