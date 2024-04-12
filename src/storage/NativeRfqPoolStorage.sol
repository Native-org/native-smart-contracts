// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

abstract contract NativeRfqPoolStorage {
    string public name;
    bool public paused;
    address public owner;
    address public router;
    address public poolFactory;
    mapping(uint256 => bool) public nonces;
    mapping(address => bool) public isSigner;
    bool public enableTreasuryCallback;
    address public weth;
    address public treasury;
    address public pendingOwner;
}
