// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct MsgDataSt0 {
    bytes el0;
}

contract MsgDataToStructMemberCopy {
    function f() external returns (MsgDataSt0 memory) {
        MsgDataSt0 memory x;
        x.el0 = msg.data;
        return x;
    }

    function g() external returns (MsgDataSt0 memory) {
        bytes memory temp = msg.data;
        MsgDataSt0 memory x;
        x.el0 = temp;
        return x;
    }

    function large(uint256, uint256, uint256, uint256) external returns (MsgDataSt0 memory) {
        MsgDataSt0 memory x;
        x.el0 = msg.data;
        return x;
    }

    function another_large(uint256, uint256, uint256, uint256) external returns (MsgDataSt0 memory) {
        bytes memory temp = msg.data;
        MsgDataSt0 memory x;
        x.el0 = temp;
        return x;
    }
}
