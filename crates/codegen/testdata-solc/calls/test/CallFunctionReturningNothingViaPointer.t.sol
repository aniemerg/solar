// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CallFunctionReturningNothingViaPointer.sol";

contract CallFunctionReturningNothingViaPointerTest {
    CallFunctionReturningNothingViaPointer c;

    function setUp() public {
        c = new CallFunctionReturningNothingViaPointer();
    }

    function test_f_returns_true() public {
        assert(c.f() == true);
    }

    function test_flag_is_true_after_f() public {
        c.f();
        assert(c.flag() == true);
    }
}
