// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ReturnInModifier.sol";

contract ReturnInModifierTest {
    ReturnInModifier c;

    function setUp() public {
        c = new ReturnInModifier();
    }

    function test_ReturnInModifier() public {
        assert(c.x() == 0);
        c.f();
        assert(c.x() == 4);
    }
}
