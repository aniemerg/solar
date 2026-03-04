// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MsgSender.sol";

contract MsgSenderTest {
    function test_MsgSender() public {
        MsgSender c = new MsgSender();
        // msg.sender in the contract returns the caller (this test contract)
        assert(c.f() == address(this));
    }
}
