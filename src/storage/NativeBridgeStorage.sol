// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import {INativeBridge} from "../interfaces/INativeBridge.sol";

abstract contract NativeBridgeStorage {
    address public nativeRouter;
    address public nativeLendVault;
    address public weth;
    address public nativeSigner;

    uint256 public claimFeeBps;
    uint256 public claimBuffer;

    /// @notice user's data useful for source chain
    // user => quoteId => OrderInfo
    mapping(address => mapping(bytes16 => INativeBridge.OrderInfo)) public userOrder;
    mapping(uint32 => bool) public isDstEnabled;
    mapping(address => bool) public isExternalBridge;
    mapping(address=>bool) public isWhitelistedSolver;
    
    uint256 public refundBuffer;

    uint256[98] private __gap;
}
