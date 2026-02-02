// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventIndexedMixed.sol";

contract EventIndexedMixedTest is Test {
    EventIndexedMixed c;

    function setUp() public {
        c = new EventIndexedMixed();
    }

    function test_EventIndexedMixed() public {
        vm.expectEmit(true, false, false, true);
        emit EventIndexedMixed.E(1, 2, 3, "def");
        c.deposit();
    }
}
