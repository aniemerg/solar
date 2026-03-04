// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlobhashShadowResolution {
    function blobhash(uint256 index) public pure returns (bytes32) {
        return bytes32(index);
    }

    function f() public pure returns (bytes32) {
        return blobhash(3);
    }
}
