// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TransientStateAddressVariableMembers {
    address transient a;
    function f() public returns (uint) {
        a = msg.sender;
        return a.balance;
    }
    function g() public view returns (uint) {
        return a.balance;
    }
}
