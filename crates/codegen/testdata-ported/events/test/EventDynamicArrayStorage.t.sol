// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventDynamicArrayStorage.sol";

contract EventDynamicArrayStorageTest is Test {
    EventDynamicArrayStorage c;

    function setUp() public {
        c = new EventDynamicArrayStorage();
    }

    function test_EventDynamicArrayStorage() public {
        vm.expectEmit(false, false, false, true);
        uint256[] memory arr = new uint256[](3);
        arr[0] = 42;
        arr[1] = 43;
        arr[2] = 44;
        emit EventDynamicArrayStorage.E(arr);
        c.createEvent(42);
    }
}
