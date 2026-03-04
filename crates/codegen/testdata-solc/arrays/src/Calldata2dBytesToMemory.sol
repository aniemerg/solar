// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract Calldata2dBytesToMemory {
    function g(bytes[2] memory m) internal returns (bytes memory) {
        return m[0];
    }
    function f(bytes[2] calldata c) external returns (bytes memory) {
        return g(c);
    }
}
