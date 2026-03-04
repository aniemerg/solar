// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStructToStorage {
    struct S {
        uint256 a;
        uint64 b;
        bytes2 c;
    }

    uint[153] r;
    S s;

    function f(uint32 a, S calldata c, uint256 b) external returns (uint256, uint256, bytes1) {
        s = c;
        return (s.a, s.b, s.c[1]);
    }
}
