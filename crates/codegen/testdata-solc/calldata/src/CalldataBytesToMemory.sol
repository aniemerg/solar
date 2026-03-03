// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataBytesToMemory {
    function f(bytes calldata data) external pure returns (bytes32) {
        return keccak256(bytes(data));
    }
}
