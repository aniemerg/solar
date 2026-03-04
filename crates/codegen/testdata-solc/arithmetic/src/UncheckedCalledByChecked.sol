// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UncheckedCalledByChecked {
    function add(uint16 a, uint16 b) public pure returns (uint16) {
        unchecked {
            return a + b;
        }
    }

    function f(uint16 a) public pure returns (uint16) {
        return add(a, 0x100) + 0x100;
    }
}
