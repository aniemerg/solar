// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract ArrayOfStructCalldataToStorage {
    struct S {
        uint128 a;
        uint64 b;
        uint128 c;
    }
    uint128[137] unused;
    S[] s;
    function f(S[] calldata c) public returns (uint128, uint64, uint128) {
        s = c;
        return (s[2].a, s[1].b, s[0].c);
    }
}
