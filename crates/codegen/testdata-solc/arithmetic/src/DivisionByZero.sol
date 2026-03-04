// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DivisionByZero {
    function div(uint256 a, uint256 b) public pure returns (uint256) {
        return a / b;
    }

    function mod(uint256 a, uint256 b) public pure returns (uint256) {
        return a % b;
    }
}
