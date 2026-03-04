// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingInternalReturn.sol";

contract MappingInternalReturnTest {
    MappingInternalReturn c;

    function setUp() public {
        c = new MappingInternalReturn();
    }

    function test_g() public {
        // f() sets a[1]=42, b[1]=84, returns ref to b; f()[2]=21 sets b[2]=21
        (uint8 a0, uint8 a1, uint8 a2, uint8 b0, uint8 b1, uint8 b2) = c.g();
        assert(a0 == 0);
        assert(a1 == 42);
        assert(a2 == 0);
        assert(b0 == 0);
        assert(b1 == 84);
        assert(b2 == 21);
    }

    function test_h() public {
        // f() sets a[1]=42, b[1]=84, returns ref to b; m=b, m[2]=17 sets b[2]=17
        (uint8 a0, uint8 a1, uint8 a2, uint8 b0, uint8 b1, uint8 b2) = c.h();
        assert(a0 == 0);
        assert(a1 == 42);
        assert(a2 == 0);
        assert(b0 == 0);
        assert(b1 == 84);
        assert(b2 == 17);
    }
}
