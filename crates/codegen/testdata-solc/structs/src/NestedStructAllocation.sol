// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NestedStructAllocation {
    struct I {
        uint b;
        uint c;
    }
    struct S {
        I a;
    }

    function f() external pure returns (uint) {
        S memory s = S(I(1, 2));
        return s.a.b;
    }
}
