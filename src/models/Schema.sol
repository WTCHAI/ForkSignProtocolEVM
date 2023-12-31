// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ISPResolver} from "../interfaces/ISPResolver.sol";
import {DataLocation} from "./DataLocation.sol";

/**
 * @title Schema
 * @author Jack Xu @ EthSign
 * @notice This struct represents an on-chain Schema that Attestations can conform to.
 *
 * `revocable`: Whether Attestations that adopt this Schema can be revoked.
 * `schemaDataLocation`: Where `Schema.data` is stored. See `DataLocation.DataLocation`.
 * `attestationDataLocation`: Where `Attestation.data` is stored. See `DataLocation.DataLocation`.
 * `maxValidFor`: The maximum number of seconds that an Attestation can remain valid. 0 means Attestations can be valid forever. This is enforced through `Attestation.validUntil`.
 * `resolver`: The `ISPResolver` that is called at the end of every function. 0 means there is no resolver is set. See `ISPResolver`.
 * `data`: The raw schema that `Attestation.data` should follow. Since there is no way to enforce this, it is a `string` for easy readability.
 */
struct Schema {
    bool revocable;
    DataLocation schemaDataLocation;
    DataLocation attestationDataLocation;
    uint64 maxValidFor;
    ISPResolver resolver;
    string data;
}
