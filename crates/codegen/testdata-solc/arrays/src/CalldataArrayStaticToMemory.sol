// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayStaticToMemory {
    function f(uint256[2] calldata c) public returns (uint256, uint256) {
        uint256[2] memory m1 = c;
        return (m1[0], m1[1]);
    }
}
