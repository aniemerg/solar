// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStructWithNestedArrayToMemory {
    struct S {
        uint128 p1;
        uint256[][2] a;
        uint32 p2;
    }

    function f(uint32 p1, S calldata c)
        external
        returns (uint32, uint128, uint256, uint256, uint32)
    {
        S memory s = c;
        assert(s.a[0][0] == c.a[0][0]);
        assert(s.a[1][1] == c.a[1][1]);
        s.p1++;
        assert(s.p1 != c.p1);
        s.a[0][1]++;
        assert(s.a[0][1] != c.a[0][1]);
        return (p1, s.p1, s.a[0][0], s.a[1][1], s.p2);
    }
}
