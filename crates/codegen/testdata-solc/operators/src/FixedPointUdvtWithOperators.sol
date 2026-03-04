// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type Fixed is int128;
using {add as +, mul as *} for Fixed global;

int constant MULTIPLIER = 10**18;

function add(Fixed a, Fixed b) pure returns (Fixed) {
    return Fixed.wrap(Fixed.unwrap(a) + Fixed.unwrap(b));
}

function mul(Fixed a, Fixed b) pure returns (Fixed) {
    int intermediate = (int(Fixed.unwrap(a)) * int(Fixed.unwrap(b))) / MULTIPLIER;
    if (int128(intermediate) != intermediate) { revert("Overflow"); }
    return Fixed.wrap(int128(intermediate));
}

contract C {
    function applyInterest(Fixed value, Fixed percentage) public pure returns (Fixed result) {
        return value + value * percentage;
    }
}
