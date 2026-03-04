// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayCalldataAssignment {
    function f(uint256[] calldata x, uint256[] calldata y, uint256 i) external returns (uint256) {
        x = y;
        return x[i];
    }
}
