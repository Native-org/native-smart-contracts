// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

// just a placeholder now in case there is any future state variables
abstract contract NativeRouterStorage {
    address public widgetFeeSigner;
    address public pauser;
    mapping(address => bool) public contractCallerWhitelist;
    bool public contractCallerWhitelistEnabled;
    mapping(address => mapping(bytes4 => bool)) public externalRouterSelectorWhitelist; // deprecated vairable DO NOT DELETE
    mapping(address => bool) public externalRouterWhitelist;

    uint256[95] private __gap;
}
