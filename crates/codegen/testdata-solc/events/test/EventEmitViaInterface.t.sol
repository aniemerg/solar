// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventEmitViaInterface.sol";

contract EventEmitViaInterfaceTest is Test {
    EventEmitViaInterface c;

    function setUp() public {
        c = new EventEmitViaInterface();
    }

    function test_emitEvent() public {
        address sender = address(0x1212121212121212121212121212120000000012);
        vm.prank(sender);
        vm.expectEmit(true, false, false, true);
        emit I.Event(sender, 100);
        c.emitEvent(100);
    }
}
