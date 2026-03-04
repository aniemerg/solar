// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayOfStructMemoryToStorage {
    struct S {
        uint128 a;
        uint64 b;
        uint128 c;
    }
    uint128[137] unused;
    S[] s;
    function f() public returns (uint128, uint64, uint128) {
        S[] memory m = new S[](3);
        m[2].a = 10;
        m[1].b = 11;
        m[0].c = 12;
        s = m;
        return (s[2].a, s[1].b, s[0].c);
    }
}
