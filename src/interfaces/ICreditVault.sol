// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

interface ICreditVault {
    struct TokenAmountUint {
        address tokenAddress;
        uint amount;
    }

    struct TokenAmountInt {
        address tokenAddress;
        int amount;
    }

    struct TraderPositionUpdate {
        address trader;
        TokenAmountInt[] tokenAmountUpdates;
    }

    struct LpTokenValueUpdate {
        address tokenAddress;
        uint netBorrowChange;
        uint reserveChange;
    }

    struct SettlementRequest {
        uint nonce;
        uint deadline;
        address trader;
        TokenAmountInt[] positionUpdates;
        address recipient;
    }

    struct RemoveCollateralRequest {
        uint nonce;
        uint deadline;
        address trader;
        TokenAmountUint[] tokens;
        address recipient;
    }

    struct LiquidationRequest {
        uint nonce;
        uint deadline;
        address trader;
        TokenAmountInt[] positionUpdates;
        TokenAmountUint[] claimCollaterals;
        address recipient;
    }

    error CallerNotAdmin();
    error CallerNotTraderSettler();
    error CallerNotLiquidator();
    error CallerNotNativePool();
    error CallerNotLpToken();
    error CallerNotEpochUpdater();
    error InvalidMarket();
    error ZeroError();
    error CallerNotPendingAdmin();
}
