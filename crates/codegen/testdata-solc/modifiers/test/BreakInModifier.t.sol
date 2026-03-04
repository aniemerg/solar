// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BreakInModifier.sol";

contract BreakInModifierTest {
    BreakInModifier c;

    function setUp() public {
        c = new BreakInModifier();
    }

    function test_break_in_modifier() public {
        assert(c.x() == 0);
        c.f();
        assert(c.x() == 2);
    }
}
