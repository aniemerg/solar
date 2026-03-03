// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorStaticCalldataUintArrayAndDynamicArray {
    error E(uint[], uint[1]);

    function f(uint[] memory a, uint[1] calldata b) public {
        revert E(a, b);
    }
}
