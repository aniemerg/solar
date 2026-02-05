// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventNoArguments.sol";

contract EventNoArgumentsTest is Test {
    EventNoArguments c;

    function setUp() public {
        c = new EventNoArguments();
    }

    function test_EventNoArguments() public {
        vm.expectEmit(false, false, false, false);
        emit EventNoArguments.E();
        c.emitEvent();
    }
}
