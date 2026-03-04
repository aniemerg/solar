// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EmitThreeIdenticalEvents.sol";

contract EmitThreeIdenticalEventsTest is Test {
    EmitThreeIdenticalEvents c;

    function setUp() public {
        c = new EmitThreeIdenticalEvents();
    }

    function test_EmitThreeIdenticalEvents() public {
        vm.expectEmit(false, false, false, false);
        emit EmitThreeIdenticalEvents.Terminated();
        vm.expectEmit(false, false, false, false);
        emit EmitThreeIdenticalEvents.Terminated();
        vm.expectEmit(false, false, false, false);
        emit EmitThreeIdenticalEvents.Terminated();
        c.terminate();
    }
}
