// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CheckedCalledByUnchecked {
    function add(uint16 a, uint16 b) public pure returns (uint16) {
        return a + b;
    }

    function f(uint16 a, uint16 b, uint16 c) public pure returns (uint16) {
        unchecked { return add(a, b) + c; }
    }
}
