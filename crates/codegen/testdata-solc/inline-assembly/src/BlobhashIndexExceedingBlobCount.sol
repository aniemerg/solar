// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlobhashIndexExceedingBlobCount {
    function f() public view returns (bytes32 ret) {
        assembly {
            // EIP-4844 specifies that if `index >= len(tx.blob_versioned_hashes)`, `blobhash(index)` should return 0.
            // Thus, as we injected only two blob hashes in the transaction context in EVMHost,
            // the return value of the function below MUST be zero.
            ret := blobhash(2)
        }
    }
}
