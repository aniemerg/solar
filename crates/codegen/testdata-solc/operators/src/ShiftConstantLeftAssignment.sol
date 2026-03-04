// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() public pure returns (uint256 a) {
        a = 0x42;
        a <<= 8;
    }
}
