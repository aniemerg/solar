// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EmitTwoIdenticalEvents.sol";

contract EmitTwoIdenticalEventsTest is Test {
    EmitTwoIdenticalEvents c;

    function setUp() public {
        c = new EmitTwoIdenticalEvents();
    }

    function test_EmitTwoIdenticalEvents() public {
        vm.expectEmit(false, false, false, false);
        emit EmitTwoIdenticalEvents.Terminated();
        vm.expectEmit(false, false, false, false);
        emit EmitTwoIdenticalEvents.Terminated();
        c.terminate();
    }
}
