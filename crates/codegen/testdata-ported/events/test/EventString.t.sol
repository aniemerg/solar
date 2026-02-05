// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventString.sol";

contract EventStringTest is Test {
    EventString c;

    function setUp() public {
        c = new EventString();
    }

    function test_EventString() public {
        vm.expectEmit(false, false, false, true);
        emit EventString.E("HELLO WORLD");
        c.deposit();
    }
}
