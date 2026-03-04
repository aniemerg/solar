// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssignCalldataValueType {
    function f(uint256 x) public pure returns (uint256, uint256) {
        uint256 b = x;
        x = 42;
        return (x, b);
    }
}
