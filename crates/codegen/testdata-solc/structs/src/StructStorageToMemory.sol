// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructStorageToMemory {
    struct S {
        uint32 a;
        uint128 b;
        uint256 c;
    }
    struct X {
        uint32 a;
        S s;
    }

    uint[79] arr;
    X x = X(12, S(42, 23, 34));

    function f() external view returns (uint32, uint128, uint256) {
        X memory m = x;
        return (m.s.a, m.s.b, m.s.c);
    }
}
