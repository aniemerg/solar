// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CheckedModifierCalledByUnchecked {
    modifier add(uint16 a, uint16 b) {
        unchecked { a + b; }
        _;
    }

    function f(uint16 a, uint16 b, uint16 c) public add(a, b) returns (uint16) {
        return b + c;
    }
}
