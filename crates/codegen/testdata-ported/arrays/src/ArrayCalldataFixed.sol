// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayCalldataFixed {
    function f(uint256[2] calldata s) external pure returns (uint256 a, uint256 b) {
        a = s[0];
        b = s[1];
    }
}
