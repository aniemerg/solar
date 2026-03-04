// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventsWithSameNameInheritedEmit.sol";

contract EventsWithSameNameInheritedEmitTest is Test {
    EventsWithSameNameInheritedEmit c;
    address constant ADDR = 0x5082a85C489be6aa0f2e6693BF09CC1BBD35e988;

    function setUp() public {
        c = new EventsWithSameNameInheritedEmit();
    }

    function test_deposit_no_args() public {
        vm.expectEmit(false, false, false, false);
        emit A.Deposit();
        uint r = c.deposit();
        assert(r == 1);
    }

    function test_deposit_addr() public {
        vm.expectEmit(false, false, false, true);
        emit B.Deposit(ADDR);
        uint r = c.deposit(ADDR);
        assert(r == 1);
    }

    function test_deposit_addr_amount() public {
        vm.expectEmit(false, false, false, true);
        emit EventsWithSameNameInheritedEmit.Deposit(ADDR, 100);
        uint r = c.deposit(ADDR, 100);
        assert(r == 1);
    }
}
