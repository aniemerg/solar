// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/Event.sol";

contract EventTest is Test {
    Event c;

    function setUp() public {
        c = new Event();
    }

    function test_deposit_manually() public {
        address sender = address(0x1212121212121212121212121212120000000012);
        bytes32 id = bytes32(uint256(0x1234));
        uint256 value = 18;
        vm.deal(sender, value);
        vm.expectEmit(true, true, true, true);
        emit Event.Deposit(sender, id, value);
        vm.prank(sender);
        c.deposit{value: value}(id, true);
    }

    function test_deposit_not_manually() public {
        address sender = address(0x1212121212121212121212121212120000000012);
        bytes32 id = bytes32(uint256(0x1234));
        uint256 value = 18;
        vm.deal(sender, value);
        vm.expectEmit(true, true, true, true);
        emit Event.Deposit(sender, id, value);
        vm.prank(sender);
        c.deposit{value: value}(id, false);
    }
}
