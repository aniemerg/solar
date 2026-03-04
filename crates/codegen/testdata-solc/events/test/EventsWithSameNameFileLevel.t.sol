// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventsWithSameNameFileLevel.sol";

contract EventsWithSameNameFileLevelTest is Test {
    EventsWithSameNameFileLevel c;
    address constant ADDR = 0x5082a85C489be6aa0f2e6693BF09CC1BBD35e988;

    function setUp() public {
        c = new EventsWithSameNameFileLevel();
    }

    function test_deposit_no_args() public {
        vm.expectEmit(false, false, false, false);
        emit Deposit();
        uint r = c.deposit();
        assert(r == 1);
    }

    function test_deposit_addr() public {
        vm.expectEmit(false, false, false, true);
        emit Deposit(ADDR);
        uint r = c.deposit(ADDR);
        assert(r == 2);
    }

    function test_deposit_addr_amount() public {
        vm.expectEmit(false, false, false, true);
        emit Deposit(ADDR, uint(100));
        uint r = c.deposit(ADDR, 100);
        assert(r == 3);
    }

    function test_deposit_addr_flag() public {
        vm.expectEmit(false, false, false, true);
        emit Deposit(ADDR, false);
        uint r = c.deposit(ADDR, false);
        assert(r == 4);
    }
}
