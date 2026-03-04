// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f(int256 a, uint256 b) public pure returns (int256) {
        a >>= b;
        return a;
    }
}
