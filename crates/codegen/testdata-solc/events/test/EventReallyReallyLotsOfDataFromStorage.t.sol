// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventReallyReallyLotsOfDataFromStorage.sol";

contract EventReallyReallyLotsOfDataFromStorageTest is Test {
    EventReallyReallyLotsOfDataFromStorage c;

    function setUp() public {
        c = new EventReallyReallyLotsOfDataFromStorage();
    }

    function test_deposit() public {
        bytes memory expected = new bytes(31);
        expected[0] = "A";
        expected[1] = "B";
        expected[2] = "C";
        expected[30] = "Z";
        vm.expectEmit(false, false, false, true);
        emit EventReallyReallyLotsOfDataFromStorage.Deposit(10, expected, 15);
        c.deposit();
    }
}
