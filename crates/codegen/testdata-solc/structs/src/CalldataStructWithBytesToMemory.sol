// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStructWithBytesToMemory {
    struct S {
        uint256 a;
        bytes b;
        uint256 c;
    }

    function f(S calldata c) external pure returns (uint256, bytes1, bytes1, uint256) {
        S memory m = c;
        return (m.a, m.b[0], m.b[1], m.c);
    }
}
