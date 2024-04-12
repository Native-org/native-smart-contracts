// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

abstract contract NativePoolFactoryStorage {
    address[] public poolArray;
    address public registry;
    mapping(address => bool) public pools;
    mapping(address => address) public treasuryToPool; // deprecated
    mapping(address => bool) public isMultiPoolTreasury;
    address public poolImplementation;
    address public pauser;
    mapping(address => bool) public rfqPools;
    mapping(address => address[]) public treasuryToPools;

    uint256[98] private __gap;
}
