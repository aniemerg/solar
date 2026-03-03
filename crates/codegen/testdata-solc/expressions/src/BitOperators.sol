// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BitOperators {
    function f() public pure returns (uint256 x, uint256 y, uint256 z) {
        uint16 a;
        uint32 b;
        assembly {
            a := 0x0f0f0f0f0f
            b := 0xff0fff0fff
        }
        x = a & b;
        y = a | b;
        z = a ^ b;
    }
}
