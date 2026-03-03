// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierMultipleTimes.sol";

contract FunctionModifierMultipleTimesTest {
    FunctionModifierMultipleTimes c;

    function setUp() public {
        c = new FunctionModifierMultipleTimes();
    }

    function test_FunctionModifierMultipleTimes() public {
        assert(c.f(3) == 10);
        assert(c.a() == 10);
    }
}
