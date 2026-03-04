// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CheckedAddV1 {
    function f(uint16 a, uint16 b) public pure returns (uint16) {
        return a + b;
    }
}
