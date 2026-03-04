// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f(uint256 a, uint256 b) public pure returns (uint256) {
        a >>= b;
        return a;
    }
}
