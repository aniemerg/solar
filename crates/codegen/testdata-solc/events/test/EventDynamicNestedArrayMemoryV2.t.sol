// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventDynamicNestedArrayMemoryV2.sol";

contract EventDynamicNestedArrayMemoryV2Test is Test {
    EventDynamicNestedArrayMemoryV2 c;

    function setUp() public {
        c = new EventDynamicNestedArrayMemoryV2();
    }

    function test_createEvent() public {
        uint[][] memory arr = new uint[][](2);
        arr[0] = new uint[](2);
        arr[1] = new uint[](2);
        arr[0][0] = 42;
        arr[0][1] = 43;
        arr[1][0] = 44;
        arr[1][1] = 45;
        vm.expectEmit(false, false, false, true);
        emit EventDynamicNestedArrayMemoryV2.E(arr);
        c.createEvent(42);
    }
}
