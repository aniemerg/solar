// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventAnonymous.sol";

contract EventAnonymousTest is Test {
    EventAnonymous c;

    function setUp() public {
        c = new EventAnonymous();
    }

    function test_EventAnonymous() public {
        vm.expectEmit(false, false, false, false);
        emit EventAnonymous.Deposit();
        c.deposit();
    }
}
