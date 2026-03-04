// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ContinueInModifier.sol";

contract ContinueInModifierTest {
    ContinueInModifier c;

    function setUp() public {
        c = new ContinueInModifier();
    }

    function test_continue_in_modifier() public {
        assert(c.x() == 0);
        c.f();
        assert(c.x() == 5);
    }
}
