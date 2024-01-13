// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { DataLocation } from "./DataLocation.sol";

/**
 * @title Attestation
 * @author Jack Xu @ EthSign
 * @notice This struct represents an on-chain attestation record. This record is not deleted after revocation.
 *
 * `schemaId`: The `Schema` that this Attestation is based on. It must exist.
 * `dataLocation`: Where `Attestation.data` is stored. See `DataLocation.DataLocation`.
 * `linkedAttestationId`: Useful if the current Attestation references a previous Attestation. It can either be 0 or an
 * existing attestation ID.
 * `attester`: The attester. At this time, the attester must be the caller of `attest()`.
 * `validUntil`: The expiration timestamp of the Attestation. Must respect `Schema.maxValidFor`. 0 indicates no
 * expiration date.
 * `revoked`: If the Attestation has been revoked. It is possible to make a revoked Attestation.
 * `recipients`: The intended ABI-encoded recipients of this Attestation. This is of type `bytes` to support non-EVM
 * repicients.
 * `data`: The raw data of the Attestation based on `Schema.schema`. There is no enforcement here, however. Recommended
 * to use `abi.encode`.
 */
struct Attestation {
    uint256 schemaId;
    DataLocation dataLocation;
    uint256 linkedAttestationId;
    address attester;
    uint64 validUntil;
    bool revoked;
    bytes[] recipients;
    bytes data;
}

/**
 * @title OffchainAttestation
 * @author Jack Xu @ EthSign
 * @notice This struct represents an off-chain attestation record. This record is not deleted after revocation.
 *
 * `attester`: The attester. At this time, the attester must be the caller of `attestOffchain()`.
 * `timestamp`: The `block.timestamp` of the function call.
 */
struct OffchainAttestation {
    address attester;
    uint64 timestamp;
}
