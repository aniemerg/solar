// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultislotStructAllocation {
    struct I {
        uint b;
        uint c;
        function(uint) external returns (uint) x;
    }
    struct S {
        I a;
    }

    function o(uint a) external pure returns (uint) {
        return a + 1;
    }

    function f() external returns (uint) {
        S memory s = S(I(1, 2, this.o));
        return s.a.x(1);
    }
}
