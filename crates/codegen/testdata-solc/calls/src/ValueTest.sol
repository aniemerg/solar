// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ValueTest {
    function f() public payable returns (uint) {
        return msg.value;
    }
}
