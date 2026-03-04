// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionalExpressionDifferentTypes {
    function f(bool cond) public pure returns (uint) {
        uint8 x = 0xcd;
        uint16 y = 0xabab;
        return cond ? x : y;
    }
}
