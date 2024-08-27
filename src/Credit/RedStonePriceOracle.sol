// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import { PullModelPriceOracle } from "./PullModelPriceOracle.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { CToken } from "../Compound/CToken.sol";
import { CreditLpToken } from "./CreditLpToken.sol";
import { PrimaryProdDataServiceConsumerBase } from "@redstone-finance/evm-connector/contracts/data-services/PrimaryProdDataServiceConsumerBase.sol";

contract RedStonePriceOracle is
  PullModelPriceOracle,
  Ownable,
  PrimaryProdDataServiceConsumerBase
{
  uint8 private constant EXPECTED_DECIMALS = 18;
  uint8 private constant REDSTONE_PRICE_DECIMALS = 8;
  uint8 private constant DECIMAL_DELTA =
    EXPECTED_DECIMALS - REDSTONE_PRICE_DECIMALS;

  uint256 public priceExpiryTime = 60 seconds;
  mapping(CToken => bytes32) public priceIds;
  mapping(bytes32 => Price) public prices;

  struct Price {
    uint256 price;
    uint256 lastUpdatedTimestamp;
  }

  error StalePrice(address cToken);
  error FailToExtractPrices(bytes errorData);
  error UnexpectedMsgValue();
  error InputArrayLengthMismatch();
  error InvalidPayloadLength();

  function extractPrice(
    bytes32[] calldata feedId
  ) public view returns (uint256[] memory prices) {
    prices = new uint256[](feedId.length);
    for (uint256 i = 0; i < feedId.length; i++) {
      prices[i] = getOracleNumericValueFromTxMsg(feedId[i]);
    }
  }

  function updatePrices(
    address[] calldata,
    bytes32[] calldata _priceIds,
    bytes[] calldata redstonePayloads, // only take the first one
    address
  ) external payable override {
    if (msg.value != 0) {
      revert UnexpectedMsgValue();
    }
    if (redstonePayloads.length != 1) {
      revert InvalidPayloadLength();
    }
    bytes memory priceIdsCalldata = abi.encodeWithSelector(
      this.extractPrice.selector,
      _priceIds
    );
    (bool success, bytes memory result) = address(this).call(
      abi.encodePacked(priceIdsCalldata, redstonePayloads[0])
    );
    if (!success) {
      revert FailToExtractPrices(result);
    }

    uint256[] memory extractedPrices = abi.decode(result, (uint256[]));
    for (uint256 i = 0; i < extractedPrices.length; i++) {
      prices[_priceIds[i]].price = extractedPrices[i];
      prices[_priceIds[i]].lastUpdatedTimestamp = block.timestamp;
    }
  }

  function setPriceId(
    CToken[] calldata cTokens,
    bytes32[] calldata priceId
  ) external onlyOwner {
    if (cTokens.length != priceId.length) {
      revert InputArrayLengthMismatch();
    }
    for (uint256 i = 0; i < cTokens.length; i++) {
      isTokenOracleSupported[cTokens[i]] = true;
      priceIds[cTokens[i]] = priceId[i];
    }
  }

  function setPriceExpiryTime(uint256 expiry) external onlyOwner {
    priceExpiryTime = expiry;
  }

  function getUnderlyingPrice(
    CToken cToken
  ) external view override returns (uint256) {
    Price memory price = prices[priceIds[cToken]];

    if (block.timestamp - price.lastUpdatedTimestamp > priceExpiryTime) {
      revert StalePrice(address(cToken));
    }

    uint256 redstonePrice = price.price * 10 ** DECIMAL_DELTA;

    // This oracle is designed based on the assumption that it has an underlying token (not native token), and the token has a decimals public variable
    uint8 tokenDecimals = IERC20Decimals(
      CreditLpToken(address(cToken)).underlying()
    ).decimals();

    if (tokenDecimals < EXPECTED_DECIMALS) {
      return redstonePrice * (10 ** (EXPECTED_DECIMALS - tokenDecimals));
    } else if (tokenDecimals > EXPECTED_DECIMALS) {
      return redstonePrice / (10 ** (tokenDecimals - EXPECTED_DECIMALS));
    }

    return redstonePrice;
  }
}

interface IERC20Decimals {
  function decimals() external view returns (uint8);
}
