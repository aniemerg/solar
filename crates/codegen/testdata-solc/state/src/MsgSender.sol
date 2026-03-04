// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MsgSender {
    function f() public view returns (address) {
        return msg.sender;
    }
}
