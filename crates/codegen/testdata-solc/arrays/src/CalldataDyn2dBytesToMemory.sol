// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract CalldataDyn2dBytesToMemory {
    function f(bytes[] calldata c) external returns (bytes[] memory) {
        return c;
    }
}
