// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EventIndexedFunction.sol";

contract EventIndexedFunctionTest {
    EventIndexedFunction c;

    function setUp() public {
        c = new EventIndexedFunction();
    }

    function test_f() public {
        // Emits Test(function) with indexed function type; verify call succeeds
        c.f();
    }
}
