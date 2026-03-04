// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AbiEncodeEmptyString {
    function f() public pure returns (bytes memory, bytes memory) {
        return (abi.encode(""), abi.encodePacked(""));
    }
}
