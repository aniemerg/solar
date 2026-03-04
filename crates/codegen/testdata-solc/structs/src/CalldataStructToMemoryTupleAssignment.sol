// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStructToMemoryTupleAssignment {
    struct S {
        uint128 p1;
        uint256[][2] a;
        uint32 p2;
    }

    function f(uint32 p1, S calldata c)
        external
        returns (uint32, uint128, uint256, uint256, uint32)
    {
        S memory m;
        uint32 p2;
        (p2, m) = (p1, c);
        m.p1++;
        m.a[0][1]++;
        return (p2, m.p1, m.a[0][0], m.a[1][1], m.p2);
    }
}
