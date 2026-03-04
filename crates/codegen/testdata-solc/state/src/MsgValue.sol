// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MsgValue {
    function f() public payable returns (uint) {
        return msg.value;
    }
}
