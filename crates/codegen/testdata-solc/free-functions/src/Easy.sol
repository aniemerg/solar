// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

function add(uint a, uint b) pure returns (uint) {
    return a + b;
}

contract Easy {
    function f(uint x) public pure returns (uint) {
        return add(x, 2);
    }
}
