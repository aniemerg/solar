// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventAnonymousWithTopics.sol";

contract EventAnonymousWithTopicsTest is Test {
    EventAnonymousWithTopics c;

    function setUp() public {
        c = new EventAnonymousWithTopics();
    }

    function test_EventAnonymousWithTopics() public {
        address sender = address(0x1212121212121212121212121212120000000012);
        bytes32 id = bytes32(uint256(0x1234));
        uint256 value = 18;
        vm.deal(sender, value);
        vm.expectEmit(true, true, true, true);
        emit EventAnonymousWithTopics.Deposit(sender, id, value, 2, "abc");
        vm.prank(sender);
        c.deposit{value: value}(id);
    }
}
