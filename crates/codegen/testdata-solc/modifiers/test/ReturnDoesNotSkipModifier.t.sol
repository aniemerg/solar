// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ReturnDoesNotSkipModifier.sol";

contract ReturnDoesNotSkipModifierTest {
    ReturnDoesNotSkipModifier c;

    function setUp() public {
        c = new ReturnDoesNotSkipModifier();
    }

    function test_return_does_not_skip_modifier() public {
        assert(c.x() == 0);
        assert(c.f() == 2);
        assert(c.x() == 9);
    }
}
