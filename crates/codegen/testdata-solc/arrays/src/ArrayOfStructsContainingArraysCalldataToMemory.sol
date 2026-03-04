// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract ArrayOfStructsContainingArraysCalldataToMemory {
    struct S {
        uint256[] a;
    }

    function f(S[] calldata c) external returns (uint256, uint256) {
        S[] memory s = c;
        assert(s.length == c.length);
        for (uint i = 0; i < s.length; i++) {
            assert(s[i].a.length == c[i].a.length);
            for (uint j = 0; j < s[i].a.length; j++) {
                assert(s[i].a[j] == c[i].a[j]);
            }
        }
        return (s[1].a.length, s[1].a[0]);
    }
}
