// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierOverriding.sol";

contract FunctionModifierOverridingTest {
    FunctionModifierOverriding c;

    function setUp() public {
        c = new FunctionModifierOverriding();
    }

    function test_f() public {
        assert(c.f() == false);
    }
}
