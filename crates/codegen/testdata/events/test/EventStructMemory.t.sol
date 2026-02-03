// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventStructMemory.sol";

contract EventStructMemoryTest is Test {
    EventStructMemory c;

    function setUp() public {
        c = new EventStructMemory();
    }

    function test_EventStructMemory() public {
        EventStructMemory.S memory s = EventStructMemory.S({a: 42});
        vm.expectEmit(false, false, false, true);
        emit EventStructMemory.E(s);
        c.createEvent(42);
    }
}
