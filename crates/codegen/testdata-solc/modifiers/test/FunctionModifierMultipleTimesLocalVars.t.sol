// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierMultipleTimesLocalVars.sol";

contract FunctionModifierMultipleTimesLocalVarsTest {
    FunctionModifierMultipleTimesLocalVars c;

    function setUp() public {
        c = new FunctionModifierMultipleTimesLocalVars();
    }

    function test_f_with_3() public {
        assert(c.f(3) == 10);
        assert(c.a() == 0);
    }
}
