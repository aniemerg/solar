// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CallFunctionReturningFunction.sol";

contract CallFunctionReturningFunctionTest {
    CallFunctionReturningFunction c;

    function setUp() public {
        c = new CallFunctionReturningFunction();
    }

    function test_f_returns_2() public {
        assert(c.f() == 2);
    }
}
