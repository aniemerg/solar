// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventAccessThroughBaseNameEmit.sol";

contract EventAccessThroughBaseNameEmitTest is Test {
    B c;

    function setUp() public {
        c = new B();
    }

    function test_f() public {
        vm.expectEmit(false, false, false, false);
        emit A.x();
        uint result = c.f();
        assert(result == 1);
    }
}
