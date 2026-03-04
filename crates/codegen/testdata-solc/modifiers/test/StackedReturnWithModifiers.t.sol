// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StackedReturnWithModifiers.sol";

contract StackedReturnWithModifiersTest {
    StackedReturnWithModifiers c;

    function setUp() public {
        c = new StackedReturnWithModifiers();
    }

    function test_stacked_return_with_modifiers() public {
        assert(c.x() == 0);
        assert(c.f() == 42);
        assert(c.x() == 4);
    }
}
