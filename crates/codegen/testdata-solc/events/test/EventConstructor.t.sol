// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventConstructor.sol";

contract EventConstructorTest is Test {
    function test_EventConstructor() public {
        address deployer = address(0x1212121212121212121212121212120000000012);
        vm.prank(deployer);
        vm.expectEmit(true, true, true, true);
        emit EventConstructor.Deposit(deployer, bytes32("abc"), 7);
        new EventConstructor();
    }
}
