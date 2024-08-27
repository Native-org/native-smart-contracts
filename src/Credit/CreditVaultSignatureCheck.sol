// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

import {EIP712, ECDSA} from "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
import {ICreditVault} from "../interfaces/ICreditVault.sol";

/// @title A contract for verifying signatures for CreditVault
/// @author Native
/// @dev Separate this contract from CreditVault to reduce contract size. It initializes and stores the EIP712 params.
///      Verifies signatures for settlement, collateral removal and liquidation requests.
contract CreditVaultSignatureCheck is EIP712 {
    /// @notice mapping to keep track of used nonces to prevent replay attacks
    /// @dev nonce => used or not.
    ///      The nonce does not follow an incremental pattern so the order does not need to be executed in order.
    ///      For each off-chain signature request, a random number to generated as nonce.
    ///      Everytime when a signature is verified, the nonce is marked as used.
    mapping(uint256 => bool) public isNonceUsed;
    address public immutable admin;
    address public aquaVault;

    constructor() EIP712("aqua vault", "1") {
        admin = msg.sender;
    }

    function setAquaVault(address aquaVault_) external {
        if (msg.sender != admin) {
            revert CallerNotAdmin();
        }
        aquaVault = aquaVault_;
    }

    modifier onlyAquaVault() {
        if (msg.sender != aquaVault) {
            revert CallerNotAquaVault();
        }
        _;
    }

    error CallerNotAdmin();
    error CallerNotAquaVault();
    error InvalidSignature();
    error RequestExpired();
    error NonceAlreadyUsed();

    // keccak256("SettlementRequest(uint256 nonce,uint256 deadline,address trader,bytes32 positionUpdates,address recipient)");
    bytes32 private constant SETTLEMENT_REQUEST_SIGNATURE_HASH =
        0xe83563cdfbb4d31bd8759eea5a634fbe67ea13b6739d04d2426c621fee979fa4;
    // keccak256("RemoveCollateralRequest(uint256 nonce,uint256 deadline,address trader,bytes32 tokens,address recipient)");
    bytes32 private constant REMOVE_COLLATERAL_REQUEST_SIGNATURE_HASH =
        0x6b9aa5f8de278806afcc63bb2d2e633b4da3536375ca60f09ae8fae5829b3c46;
    // keccak256("LiquidationRequest(uint256 nonce,uint256 deadline,address trader,bytes32 positionUpdates,bytes32 claimCollaterals,address recipient)");
    bytes32 private constant LIQUIDATION_REQUEST_SIGNATURE_HASH =
        0x76c5f3d53a01a9f0a59b081b22aba3a0f03248e9241993e97d1d025ef2ffaac2;

    /// @notice Verifies the signature for a settlement request
    /// @param request The settlement request containing long and short position updates
    /// @param signature The signature
    /// @param signer The signer (passed by CreditVault)
    function verifySettleSignature(
        ICreditVault.SettlementRequest calldata request,
        bytes calldata signature,
        address signer
    ) external onlyAquaVault {
        if (request.deadline < block.timestamp) {
            revert RequestExpired();
        }
        if (isNonceUsed[request.nonce]) {
            revert NonceAlreadyUsed();
        }
        isNonceUsed[request.nonce] = true;
        bytes32 msgHash = keccak256(
            abi.encode(
                SETTLEMENT_REQUEST_SIGNATURE_HASH,
                request.nonce,
                request.deadline,
                request.trader,
                keccak256(abi.encode(request.positionUpdates)),
                request.recipient
            )
        );
        bytes32 digest = _hashTypedDataV4(msgHash);
        address recoveredSigner = ECDSA.recover(digest, signature);
        if (recoveredSigner != signer) {
            revert InvalidSignature();
        }
    }

    /// @notice Verifies the signature for a collateral removal request
    /// @param request The collateral removal request containing the tokens to be removed
    /// @param signature The signature
    /// @param signer The signer (passed by CreditVault)
    function verifyRemoveCollateralSignature(
        ICreditVault.RemoveCollateralRequest calldata request,
        bytes calldata signature,
        address signer
    ) external onlyAquaVault {
        if (request.deadline < block.timestamp) {
            revert RequestExpired();
        }
        if (isNonceUsed[request.nonce]) {
            revert NonceAlreadyUsed();
        }
        isNonceUsed[request.nonce] = true;
        bytes32 msgHash = keccak256(
            abi.encode(
                REMOVE_COLLATERAL_REQUEST_SIGNATURE_HASH,
                request.nonce,
                request.deadline,
                request.trader,
                keccak256(abi.encode(request.tokens)),
                request.recipient
            )
        );
        bytes32 digest = _hashTypedDataV4(msgHash);
        address recoveredSigner = ECDSA.recover(digest, signature);
        if (recoveredSigner != signer) {
            revert InvalidSignature();
        }
    }

    /// @notice Verifies the signature for a liquidation request
    /// @param request The liquidation request containing the position updates and the tokens to be claimed
    /// @param signature The signature
    /// @param signer The signer (passed by CreditVault)
    function verifyLiquidationSignature(
        ICreditVault.LiquidationRequest calldata request,
        bytes calldata signature,
        address signer
    ) external onlyAquaVault {
        if (request.deadline < block.timestamp) {
            revert RequestExpired();
        }
        if (isNonceUsed[request.nonce]) {
            revert NonceAlreadyUsed();
        }
        isNonceUsed[request.nonce] = true;
        bytes32 msgHash = keccak256(
            abi.encode(
                LIQUIDATION_REQUEST_SIGNATURE_HASH,
                request.nonce,
                request.deadline,
                request.trader,
                keccak256(abi.encode(request.positionUpdates)),
                keccak256(abi.encode(request.claimCollaterals)),
                request.recipient
            )
        );
        bytes32 digest = _hashTypedDataV4(msgHash);
        address recoveredSigner = ECDSA.recover(digest, signature);
        if (recoveredSigner != signer) {
            revert InvalidSignature();
        }
    }
}
