// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f(int8 a, uint8 b) public pure returns (int256) {
        return a >> b;
    }
}
