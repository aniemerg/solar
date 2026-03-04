// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventDynamicArrayStorageV2.sol";

contract EventDynamicArrayStorageV2Test is Test {
    EventDynamicArrayStorageV2 c;

    function setUp() public {
        c = new EventDynamicArrayStorageV2();
    }

    function test_createEvent() public {
        uint[] memory arr = new uint[](3);
        arr[0] = 42;
        arr[1] = 43;
        arr[2] = 44;
        vm.expectEmit(false, false, false, true);
        emit EventDynamicArrayStorageV2.E(arr);
        c.createEvent(42);
    }
}
