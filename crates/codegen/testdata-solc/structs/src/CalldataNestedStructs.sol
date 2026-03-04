// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataNestedStructs {
    struct S {
        uint128 p1;
        uint256[][2] a;
        uint32 p2;
    }

    struct S1 {
        uint128 u;
        S s;
    }

    struct S2 {
        S[2] array;
    }

    function f1(S1 calldata c) internal pure returns (S1 memory) {
        return c;
    }

    function f(S1 calldata c, uint32 p)
        external
        pure
        returns (uint32, uint128, uint256, uint256, uint32)
    {
        S1 memory m = f1(c);
        assert(m.s.a[0][0] == c.s.a[0][0]);
        assert(m.s.a[1][1] == c.s.a[1][1]);
        return (p, m.s.p1, m.s.a[0][0], m.s.a[1][1], m.s.p2);
    }

    function g(S2 calldata c)
        external
        pure
        returns (uint128, uint256, uint256, uint32)
    {
        S2 memory m = c;
        assert(m.array[0].a[0][0] == c.array[0].a[0][0]);
        assert(m.array[0].a[1][1] == c.array[0].a[1][1]);
        return (m.array[1].p1, m.array[1].a[0][0], m.array[1].a[1][1], m.array[1].p2);
    }

    function h(S1 calldata c, uint32 p)
        external
        pure
        returns (uint32, uint128, uint256, uint256, uint32)
    {
        S memory m = c.s;
        assert(m.a[0][0] == c.s.a[0][0]);
        assert(m.a[1][1] == c.s.a[1][1]);
        return (p, m.p1, m.a[0][0], m.a[1][1], m.p2);
    }
}
