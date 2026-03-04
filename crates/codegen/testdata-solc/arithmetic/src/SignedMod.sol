// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SignedMod {
    function f(int a, int b) public pure returns (int) {
        return a % b;
    }
    function g(bool _check) public pure returns (int) {
        int x = type(int).min;
        if (_check) {
            return x / -1;
        } else {
            unchecked { return x / -1; }
        }
    }
}
