// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstevalArrayLength {
    uint constant a = 12;
    uint constant b = 10;

    function f() public pure returns (uint, uint) {
        uint[(a / b) * b] memory x;
        return (x.length, (a / b) * b);
    }
}
