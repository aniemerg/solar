// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MultiModifiers.sol";

contract MultiModifiersTest {
    MultiModifiers c;

    function setUp() public {
        c = new MultiModifiers();
    }

    function test_modifiers() public {
        c.f1();
        // modifier increments x by 1, then f1 adds 7 => x = 8
        assert(c.x() == 0x08);
        c.f2();
        // modifier increments x by 1 (9), then f2 adds 3 => x = 12 = 0x0c
        assert(c.x() == 0x0c);
    }
}
