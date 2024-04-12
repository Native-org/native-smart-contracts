// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import {PullModelPriceOracle} from "./PullModelPriceOracle.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {SafeCast} from "@openzeppelin/contracts/utils/math/SafeCast.sol";
import {CToken} from "../Compound/CToken.sol";
import {AquaLpToken} from "./AquaLpToken.sol";
import {IPyth} from "@pythnetwork/pyth-sdk-solidity/IPyth.sol";
import {PythStructs} from "@pythnetwork/pyth-sdk-solidity/PythStructs.sol";
import {IWETH9} from "../interfaces/IWETH9.sol";

contract PythPriceOracle is PullModelPriceOracle, Ownable {
    using SafeCast for int64;

    uint8 private constant EXPECTED_DECIMALS = 18;

    IPyth public immutable pyth;
    address immutable weth;
    uint256 public priceExpiryTime = 60 seconds;
    mapping(CToken => bytes32) public priceIds;

    error PriceExpoError();
    error InputArrayLengthMismatch();

    constructor(address pythContract, address _weth) {
        pyth = IPyth(pythContract);
        weth = _weth;
    }

    function updatePrices(
        address[] calldata,
        bytes32[] calldata,
        bytes[] calldata priceUpdateData,
        address refundee
    ) external payable override {
        // Update the prices to the latest available values and pay the required fee for it. The `priceUpdateData` data
        // should be retrieved from our off-chain Price Service API using the `pyth-evm-js` package.
        // See section "How Pyth Works on EVM Chains" below for more information.
        uint256 fee = pyth.getUpdateFee(priceUpdateData);
        pyth.updatePriceFeeds{value: fee}(priceUpdateData);

        uint256 balance = address(this).balance;
        if (balance != 0) {
            _transferETHAndWrapIfFailWithGasLimit(refundee, balance, 2300);
        }
    }

    function setPriceId(CToken[] calldata cTokens, bytes32[] calldata priceId) external onlyOwner {
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

    function getUnderlyingPrice(CToken cToken) external view override returns (uint256) {
        PythStructs.Price memory price = pyth.getPriceNoOlderThan(priceIds[cToken], priceExpiryTime);

        if (price.expo > 0 || uint32(-price.expo) > type(uint8).max) {
            revert PriceExpoError();
        }

        uint8 priceDecimals = uint8(uint32(-price.expo));
        uint8 decimalsDelta = EXPECTED_DECIMALS - priceDecimals;
        uint256 pythPrice = price.price.toUint256() * 10 ** decimalsDelta;

        // This oracle is designed based on the assumption that it has an underlying token (not native token), and the token has a decimals public variable
        uint8 tokenDecimals = IERC20(AquaLpToken(address(cToken)).underlying()).decimals();

        if (tokenDecimals < EXPECTED_DECIMALS) {
            return pythPrice * (10 ** (EXPECTED_DECIMALS - tokenDecimals));
        } else if (tokenDecimals > EXPECTED_DECIMALS) {
            return pythPrice / (10 ** (tokenDecimals - EXPECTED_DECIMALS));
        }

        return pythPrice;
    }

    function withdrawStuckEth() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    // ref: https://github.com/LooksRare/contracts-libs/blob/master/contracts/lowLevelCallers/LowLevelWETH.sol
    /**
     * @notice It transfers ETH to a recipient with a specified gas limit.
     *         If the original transfers fails, it wraps to WETH and transfers the WETH to recipient.
     * @param _to Recipient address
     * @param _amount Amount to transfer
     * @param _gasLimit Gas limit to perform the ETH transfer
     */
    function _transferETHAndWrapIfFailWithGasLimit(
        address _to,
        uint256 _amount,
        uint256 _gasLimit
    ) internal {
        bool status;

        assembly {
            status := call(_gasLimit, _to, _amount, 0, 0, 0, 0)
        }

        if (!status) {
            IWETH9(weth).deposit{value: _amount}();
            IWETH9(weth).transfer(_to, _amount);
        }
    }
}

interface IERC20 {
    function decimals() external view returns (uint8);
}
