// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EventIndexedFunction2.sol";

contract EventIndexedFunction2Test {
    EventIndexedFunction2 c;

    function setUp() public {
        c = new EventIndexedFunction2();
    }

    function test_f1() public {
        // Emits TestA(function) with indexed function type; verify call succeeds
        c.f1();
    }

    function test_f2() public {
        // Emits TestB(function) with indexed function type; verify call succeeds
        c.f2(1);
    }
}
