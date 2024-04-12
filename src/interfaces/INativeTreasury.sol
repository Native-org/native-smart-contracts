// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

// generic interface to treasury contract
interface INativeTreasury {
    event ReservesSynced(uint128 reserve0, uint128 reserve1);

    function syncReserve() external;

    function getReserves() external view returns (uint128 _reserve0, uint128 _reserve1);

    function setPoolAddress(address _pool) external;

    function token0() external view returns (address);

    function token1() external view returns (address);
}

interface INativeTreasuryV2 {
    function nativeTreasuryCallback(
        address signer,
        address sellerToken,
        int256 amount0Delta,
        address buyerToken,
        int256 amount1Delta
    ) external;
}
