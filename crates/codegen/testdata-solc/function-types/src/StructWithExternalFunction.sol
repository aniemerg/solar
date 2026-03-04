// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct S {
    uint16 a;
    function() external pure returns (uint) x;
    uint16 b;
}

contract StructWithExternalFunction {
    S[2] t;

    function X() public pure returns (uint) {
        return 1;
    }

    function Y() public pure returns (uint) {
        return 2;
    }

    constructor() {
        t[0].a = 0xff07;
        t[0].b = 0xff07;
        t[1].x = this.Y;
        t[1].a = 0xff07;
        t[1].b = 0xff07;
        t[0].x = this.X;
    }

    function f() public returns (uint, uint) {
        return (t[0].x(), t[1].x());
    }
}
