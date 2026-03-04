// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IteratedKeccak256WithBytes {
    bytes data;

    function foo() public returns (bytes32) {
        data.push("x");
        data.push("y");
        data.push("z");
        return keccak256(abi.encodePacked("b", keccak256(data), "a"));
    }
}
