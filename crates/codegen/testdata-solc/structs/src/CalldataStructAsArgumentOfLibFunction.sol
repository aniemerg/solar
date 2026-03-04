// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct CalldataLibS {
    uint128 p1;
    uint256[][2] a;
    uint32 p2;
}

struct CalldataLibS1 {
    uint128 u;
    CalldataLibS s;
}

library CalldataLib {
    function f(CalldataLibS1 memory m, uint32 p)
        external
        pure
        returns (uint32, uint128, uint256, uint256, uint32)
    {
        return (p, m.s.p1, m.s.a[0][0], m.s.a[1][1], m.s.p2);
    }
}

contract CalldataStructAsArgumentOfLibFunction {
    function f(CalldataLibS1 calldata c, uint32 p)
        external
        pure
        returns (uint32, uint128, uint256, uint256, uint32)
    {
        return CalldataLib.f(c, p);
    }
}
