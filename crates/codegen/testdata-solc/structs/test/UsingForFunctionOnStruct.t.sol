// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingForFunctionOnStruct.sol";

contract UsingForFunctionOnStructTest {
    UsingForFunctionOnStruct c;

    function setUp() public {
        c = new UsingForFunctionOnStruct();
    }

    function test_UsingForFunctionOnStruct() public {
        // f(7) sets x.a = 3 then multiplies: 3 * 7 = 21 = 0x15
        assert(c.f(7) == 0x15);
        // x() should return 0x15 (the stored struct value is public getter for x.a)
        assert(c.x() == 0x15);
    }
}
