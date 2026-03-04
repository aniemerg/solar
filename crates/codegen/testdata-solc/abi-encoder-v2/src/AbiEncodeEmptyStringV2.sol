// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Tests that this will not end up using a "bytes0" type
// (which would assert)
contract AbiEncodeEmptyStringV2 {
    function f() public pure returns (bytes memory, bytes memory) {
        return (abi.encode(""), abi.encodePacked(""));
    }
}
