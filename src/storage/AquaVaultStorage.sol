// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import {AquaLpToken} from "../Aqua/AquaLpToken.sol";
import {AquaVaultSignatureCheck} from "../Aqua/AquaVaultSignatureCheck.sol";

/// @title storage veriable contract for AquaVault
/// @author Native
abstract contract AquaVaultStorage {
    /// @notice map from underlying address to LP token
    mapping(address => AquaLpToken) public lpTokens;

    /// @notice NativePool this vault is serving as treasury to
    address public nativePool;

    /// @notice signer for permissioned functions: liquidate, settle, etc.
    address public signer;

    /// @notice positions for the traders (RFQ providers)
    ///         trader_address => token => amount (positive for long, negative for short)
    mapping(address => mapping(address => int)) public positions;

    /// @notice traders' collateral
    ///         trader_address => token => amount
    mapping(address => mapping(address => uint)) public aquaCollateral;

    /// @notice singature check contract address. Separated to reduce contract size
    AquaVaultSignatureCheck public aquaVaultSignatureCheck;

    /// @notice whitelist for traders (RFQ providers)
    mapping(address => bool) public isTraders;

    /// @notice whitelist for liquidators
    mapping(address => bool) public isLiquidators;

    /// @notice relate settler address to trader
    ///         trader_address => settler_address
    mapping(address => address) public traderSettlers;

    /// @notice epoch updater address
    address public epochUpdater;

    /// @notice whitelist traders that can bypass the credit check
    mapping(address => bool) public isWhitelistTraders;

    /// @notice epoch update timestamp
    uint256 public lastEpochUpdateTimestamp;

    /// @notice address to wthidraw the LP token protocol fee
    address payable public lpTokenReserveWithdrawer;

    /// @notice storage resrved for future upgrades
    uint256[49] private __gap;
}
