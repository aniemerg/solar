// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HashBuiltins {
    bytes public data;

    function keccakEmpty() public pure returns (bytes32) {
        return keccak256("");
    }

    function sha256Empty() public pure returns (bytes32) {
        return sha256("");
    }

    function ripemd160Empty() public pure returns (bytes20) {
        return ripemd160("");
    }

    function keccakBytes() public returns (bool) {
        data.push("f");
        data.push("o");
        data.push("o");
        return keccak256(data) == keccak256("foo");
    }
}
