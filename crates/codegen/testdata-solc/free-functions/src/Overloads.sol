// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

function f(uint) pure returns (uint) {
    return 2;
}

function f(string memory) pure returns (uint) {
    return 3;
}

contract Overloads {
    function g() public pure returns (uint, uint) {
        return (f(2), f("abc"));
    }
}
