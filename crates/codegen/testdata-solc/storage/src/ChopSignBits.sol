// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ChopSignBits {
    int16[] public x;
    int16[2] public y;
    int16 z;

    constructor() {
        x.push(-1);
        x.push(-2);
        y[0] = -5;
        y[1] = -6;
    }

    function f() public returns (int16[] memory) {
        int8[] memory t = new int8[](2);
        t[0] = -3;
        t[1] = -4;
        x = t;
        return x;
    }

    function g() public returns (int16[2] memory) {
        int8[2] memory t = [-3, -4];
        y = t;
        return y;
    }

    function h(int8 t) public returns (int16) {
        z = t;
        return z;
    }
}
