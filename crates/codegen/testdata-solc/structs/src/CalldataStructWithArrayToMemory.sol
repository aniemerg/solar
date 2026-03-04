// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStructWithArrayToMemory {
    struct S {
        uint256 a;
        uint256[2] b;
        uint256 c;
    }

    function f(S calldata c) external pure returns (uint256, uint256, uint256, uint256) {
        S memory m = c;
        return (m.a, m.b[0], m.b[1], m.c);
    }
}
