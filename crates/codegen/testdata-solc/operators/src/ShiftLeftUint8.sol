// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f(uint8 a, uint8 b) public pure returns (uint256) {
        return a << b;
    }
}
