// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventDynamicArrayMemory.sol";

contract EventDynamicArrayMemoryTest is Test {
    EventDynamicArrayMemory c;

    function setUp() public {
        c = new EventDynamicArrayMemory();
    }

    function test_EventDynamicArrayMemory() public {
        vm.expectEmit(false, false, false, true);
        uint256[] memory arr = new uint256[](3);
        arr[0] = 42;
        arr[1] = 43;
        arr[2] = 44;
        emit EventDynamicArrayMemory.E(arr);
        c.createEvent(42);
    }
}
