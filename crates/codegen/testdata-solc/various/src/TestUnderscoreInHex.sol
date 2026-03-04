// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestUnderscoreInHex {
    function f(bool cond) public pure returns (uint256) {
        uint32 x = 0x1234_ab;
        uint256 y = 0x1234_abcd_1234;
        return cond ? x : y;
    }
}
