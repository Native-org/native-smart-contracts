// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Ownable2StepUpgradeable} from "@openzeppelin/contracts-upgradeable/access/Ownable2StepUpgradeable.sol";

contract Metadata is UUPSUpgradeable, Ownable2StepUpgradeable {
    bool public constant IS_METADATA = true;

    struct ChainMetadata {
        string[] rpcUrls;
        address[] tokenAddrs;
        address[] lpTokenAddrs;
        string[] priceIds;
        uint8[] decimals;
        uint16[] collateralFactors;
        address aquaVault;
        address aquaRfqPool;
        address multicall;
    }

    mapping(uint => ChainMetadata) public chainMetadata;
    uint[] public chainIds;
    uint public quoteDeviationLimitBips;
    uint public creditBufferForTrustedMM;
    uint public epochUpdateChangeLimitBips;

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {
        Metadata(newImplementation).IS_METADATA();
    }

    function getImplementation() public view returns (address) {
        return _getImplementation();
    }

    function initialize() public initializer {
        __UUPSUpgradeable_init();
        __Ownable2Step_init();
        quoteDeviationLimitBips = 500;
        creditBufferForTrustedMM = 100_000;
        epochUpdateChangeLimitBips = 100;
    }

    function setQuoteDeviationLimitBips(uint newValue) external onlyOwner {
        quoteDeviationLimitBips = newValue;
    }

    function setCreditBufferForTrustedMM(uint newValue) external onlyOwner {
        creditBufferForTrustedMM = newValue;
    }

    function setEpochUpdateChangeLimitBips(uint newValue) external onlyOwner {
        epochUpdateChangeLimitBips = newValue;
    }

    function addChain(uint chainId, ChainMetadata calldata chainMetadata_) external onlyOwner {
        if (chainMetadata[chainId].rpcUrls.length > 0) {
            revert("chain already exists");
        }
        chainIds.push(chainId);
        chainMetadata[chainId] = chainMetadata_;
    }

    function removeChain(uint chainId) external onlyOwner {
        delete chainMetadata[chainId];
        for (uint i = 0; i < chainIds.length; i++) {
            if (chainIds[i] == chainId) {
                chainIds[i] = chainIds[chainIds.length - 1];
                chainIds.pop();
                break;
            }
        }
    }

    function addRpcUrls(uint chainId, string[] calldata rpcUrls) external onlyOwner {
        ChainMetadata storage metadata = chainMetadata[chainId];
        for (uint i = 0; i < rpcUrls.length; i++) {
            metadata.rpcUrls.push(rpcUrls[i]);
        }
    }

    function removeRpcUrl(uint chainId, uint index) external onlyOwner {
        ChainMetadata storage metadata = chainMetadata[chainId];
        metadata.rpcUrls[index] = metadata.rpcUrls[metadata.rpcUrls.length - 1];
        metadata.rpcUrls.pop();
    }

    function addTokens(
        uint chainId,
        address[] calldata tokens,
        address[] calldata lpTokens,
        string[] calldata priceIds_,
        uint8[] calldata decimals,
        uint16[] calldata collateralFactors
    ) external onlyOwner {
        ChainMetadata storage metadata = chainMetadata[chainId];
        for (uint i = 0; i < tokens.length; i++) {
            metadata.tokenAddrs.push(tokens[i]);
            metadata.lpTokenAddrs.push(lpTokens[i]);
            metadata.priceIds.push(priceIds_[i]);
            metadata.decimals.push(decimals[i]);
            metadata.collateralFactors.push(collateralFactors[i]);
        }
    }

    function removeToken(uint chainId, uint index) external onlyOwner {
        ChainMetadata storage metadata = chainMetadata[chainId];
        metadata.tokenAddrs[index] = metadata.tokenAddrs[metadata.tokenAddrs.length - 1];
        metadata.tokenAddrs.pop();
        metadata.lpTokenAddrs[index] = metadata.lpTokenAddrs[metadata.lpTokenAddrs.length - 1];
        metadata.lpTokenAddrs.pop();
        metadata.priceIds[index] = metadata.priceIds[metadata.priceIds.length - 1];
        metadata.priceIds.pop();
        metadata.decimals[index] = metadata.decimals[metadata.decimals.length - 1];
        metadata.decimals.pop();
        metadata.collateralFactors[index] = metadata.collateralFactors[metadata.collateralFactors.length - 1];
        metadata.collateralFactors.pop();
    }

    function setPriceIdAtIndex(uint chainId, uint[] calldata indexes, string[] calldata newPriceIds) external onlyOwner {
        ChainMetadata storage metadata = chainMetadata[chainId];
        for (uint i = 0; i < indexes.length; i++) {
            metadata.priceIds[indexes[i]] = newPriceIds[i];
        }
    }

    function setAquaVaultAddress(uint chainId, address aquaVault) external onlyOwner {
        chainMetadata[chainId].aquaVault = aquaVault;
    }

    function setAquaRfqPoolAddress(uint chainId, address aquaRfqPool) external onlyOwner {
        chainMetadata[chainId].aquaRfqPool = aquaRfqPool;
    }

    function setMulticallAddress(uint chainId, address multicall) external onlyOwner {
        chainMetadata[chainId].multicall = multicall;
    }

    function getChainMetadata(
        uint chainId
    )
        external
        view
        returns (
            string[] memory, // rpc urls
            address[] memory, // token addrs
            address[] memory, // lp token addrs
            string[] memory, // priceIds
            uint8[] memory, // decimals
            uint16[] memory, // collateral factor, in percentage
            address, // aquaVault address
            address, // aquaRfqPool address
            address // multicall address
        )
    {
        ChainMetadata memory metadata = chainMetadata[chainId];
        return (
            metadata.rpcUrls,
            metadata.tokenAddrs,
            metadata.lpTokenAddrs,
            metadata.priceIds,
            metadata.decimals,
            metadata.collateralFactors,
            metadata.aquaVault,
            metadata.aquaRfqPool,
            metadata.multicall
        );
    }

    function getChainIds() external view returns (uint[] memory) {
        return chainIds;
    }
}
