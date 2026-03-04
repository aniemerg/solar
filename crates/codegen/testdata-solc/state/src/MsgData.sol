// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MsgData {
    function f() public pure returns (bytes calldata) {
        return msg.data;
    }
    function g(uint, bool) public pure returns (bytes calldata) {
        return msg.data;
    }
}
