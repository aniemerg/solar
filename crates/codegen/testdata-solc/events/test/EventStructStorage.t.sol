// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventStructStorage.sol";

contract EventStructStorageTest is Test {
    EventStructStorage c;

    function setUp() public {
        c = new EventStructStorage();
    }

    function test_EventStructStorage() public {
        EventStructStorage.S memory s = EventStructStorage.S({a: 42});
        vm.expectEmit(false, false, false, true);
        emit EventStructStorage.E(s);
        c.createEvent(42);
    }
}
