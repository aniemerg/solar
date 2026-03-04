// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f(uint32 a, uint32 b) public pure returns (uint256) {
        return a >> b;
    }
}
