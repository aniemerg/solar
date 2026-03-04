// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlockNumber {
    function f() public view returns (uint) {
        return block.number;
    }
}
