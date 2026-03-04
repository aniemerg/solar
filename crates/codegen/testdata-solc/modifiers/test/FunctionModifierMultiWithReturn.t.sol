// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierMultiWithReturn.sol";

contract FunctionModifierMultiWithReturnTest {
    FunctionModifierMultiWithReturn c;

    function setUp() public {
        c = new FunctionModifierMultiWithReturn();
    }

    function test_f_false() public {
        assert(c.f(false) == 1);
    }

    function test_f_true() public {
        assert(c.f(true) == 2);
    }
}
