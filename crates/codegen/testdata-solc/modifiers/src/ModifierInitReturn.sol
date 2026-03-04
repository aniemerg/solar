// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModifierInitReturn {
    modifier m(bool condition) {
        if (condition) _;
    }

    function f(uint x) public m(x >= 10) returns (uint[5] memory r) {
        r[2] = 3;
    }
}
