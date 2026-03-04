// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringAllocationBug {
    struct S {
        uint16 x;
        uint16 y;
        string a;
        string b;
    }
    S[2] public p;

    constructor() {
        S memory m;
        m.x = 0xbbbb;
        m.y = 0xcccc;
        m.a = "hello";
        m.b = "world";
        p[0] = m;
    }
}
