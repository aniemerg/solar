// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingToStruct {
    struct S {
        uint8 a;
        uint16 b;
        uint128 c;
        uint d;
    }
    mapping(uint => mapping(uint => S)) public x;
    constructor() {
        x[1][2].a = 3;
        x[1][2].b = 4;
        x[1][2].c = 5;
        x[1][2].d = 6;
    }
}
