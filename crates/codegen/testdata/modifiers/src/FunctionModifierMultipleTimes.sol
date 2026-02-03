// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionModifierMultipleTimes {
    uint256 public a;

    modifier mod(uint256 x) {
        a += x;
        _;
    }

    function f(uint256 x) public mod(2) mod(5) mod(x) returns (uint256) {
        return a;
    }
}
