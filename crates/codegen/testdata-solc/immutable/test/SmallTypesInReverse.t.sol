// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SmallTypesInReverse.sol";

contract SmallTypesInReverseTest {
    function test_SmallTypesInReverse() public {
        SmallTypesInReverse c = new SmallTypesInReverse();
        assert(c.a() == 0x1234);
        assert(c.b() == 0x0f0f);
        assert(c.c() == 0xffff);
        assert(c.x(0) == 0x1234);
        assert(c.x(1) == 0x0f0f);
        assert(c.x(2) == 0xffff);
    }
}
