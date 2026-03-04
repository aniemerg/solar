// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventReallyLotsOfDataFromStorage.sol";

contract EventReallyLotsOfDataFromStorageTest is Test {
    EventReallyLotsOfDataFromStorage c;

    function setUp() public {
        c = new EventReallyLotsOfDataFromStorage();
    }

    function test_deposit() public {
        vm.expectEmit(false, false, false, true);
        emit EventReallyLotsOfDataFromStorage.Deposit(10, bytes("ABC"), 15);
        c.deposit();
    }
}
