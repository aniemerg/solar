// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventDynamicArrayMemoryV2.sol";

contract EventDynamicArrayMemoryV2Test is Test {
    EventDynamicArrayMemoryV2 c;

    function setUp() public {
        c = new EventDynamicArrayMemoryV2();
    }

    function test_createEvent() public {
        uint[] memory arr = new uint[](3);
        arr[0] = 42;
        arr[1] = 43;
        arr[2] = 44;
        vm.expectEmit(false, false, false, true);
        emit EventDynamicArrayMemoryV2.E(arr);
        c.createEvent(42);
    }
}
