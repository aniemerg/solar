// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventStaticCalldataUintArrayAndDynamicArray {
    event E(uint[], uint[1]);

    function f(uint[] memory a, uint[1] calldata b) public {
        emit E(a, b);
    }
}
