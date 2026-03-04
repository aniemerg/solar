// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

function exp(uint base, uint exponent) pure returns (uint power) {
    if (exponent == 0)
        return 1;
    power = exp(base, exponent / 2);
    power *= power;
    if (exponent & 1 == 1)
        power *= base;
}

contract Recursion {
    function g(uint base, uint exponent) public pure returns (uint) {
        return exp(base, exponent);
    }
}
