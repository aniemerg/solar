// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventStruct.sol";

contract EventStructTest is Test {
    EventStruct c;

    function setUp() public {
        c = new EventStruct();
    }

    function test_EventStruct() public {
        vm.expectEmit(true, true, true, true);
        emit EventStructLib.Ev(EventItem(1));
        c.f();
    }
}
