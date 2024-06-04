// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import "./INativePriceDecoupledLiquidityPool.sol";

interface INativePMMLiquidityPool is INativePriceDecoupledLiquidityPool {
    error ExceedTokenLiquidityCap(address token, uint amount, uint remainingQuota);
    error ExceededPeriodicWithdrawLimit(address token, uint withdrawAmount, uint remainingQuota);
    error InputArrayLengthMismatch(uint arrayLen1, uint arrayLen2);
    error UpdateCapLowerThanBalance(address token, uint updateCap, uint balance);
    error WithdrawLimitPercentageOutOfRange(uint lowerBound, uint higherBound, uint inputValue);
    error WithdrawLimitPeriodTooLong(uint limitPeriod, uint inputValue);
    error CallerNotPMM(address caller, address pmm);

    event TokenUpdated(PMMTokenDetail token);
    event PoolAddressUpdated(address newPool);
    event PrivateMarketMakerAddressUpdated(address newPrivateMarketMaker);
    event PMMTokenAdded(PMMUpdateTokenInput pmmTokenInput);

    struct PMMTokenDetail {
        uint cap;
        uint currentPeriodStartTimestamp;
        uint withdrawLimitPercentage;
        uint withdrawLimitPeriod;
        uint withdrawLimit;
    }

    struct PMMUpdateTokenInput {
        address token;
        uint cap;
        uint withdrawLimitPercentage;
        uint withdrawLimitPeriod;
    }

    function listTokens(ListTokenInput[] memory tokens, PMMUpdateTokenInput[] memory pmmTokenInputs) external;

    function updateTokens(PMMUpdateTokenInput[] calldata tokensToUpdate) external;

    function updateAllowance(address[] calldata tokens, uint[] calldata newAllowances) external;

    function setPoolAddress(address newPool) external;

    function setPrivateMarketMakerAddress(address _privateMarketMaker) external;

    function sweepExcessToken(address token) external;

    function transferForRebalance(address token, uint amount, address to) external;
}
