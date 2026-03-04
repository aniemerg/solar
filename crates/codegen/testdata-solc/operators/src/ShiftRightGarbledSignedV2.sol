// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f(int8 a, uint8 b) public pure returns (int256) {
        assembly {
            a := 0xfffffff0
        }
        // Higher bits should be signextended before the shift
        return a >> b;
    }

    function g(int8 a, uint8 b) public pure returns (int256) {
        assembly {
            a := 0xf0
        }
        // Higher bits should be signextended before the shift
        return a >> b;
    }
}
