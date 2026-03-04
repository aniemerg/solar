// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract ArrayOfStructCalldataToMemory {
    struct S {
        uint128 a;
        uint64 b;
        uint128 c;
    }
    function f(S[3] calldata c) public returns (uint128, uint64, uint128) {
        S[3] memory m = c;
        return (m[2].a, m[1].b, m[0].c);
    }
    function g(S[] calldata c) public returns (uint128, uint64, uint128) {
        S[] memory m = c;
        return (m[2].a, m[1].b, m[0].c);
    }
}
