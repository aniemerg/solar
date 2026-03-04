// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingArrayStruct {
    struct Y {
        uint a;
        uint b;
    }
    mapping(uint256 => Y[]) public m;
    mapping(uint256 => Y[3]) public n;
    constructor() {
        m[1].push().a = 1;
        m[1][0].b = 2;
        m[1].push().a = 3;
        m[1][1].b = 4;
        n[1][0].a = 7;
        n[1][0].b = 8;
        n[1][1].a = 9;
        n[1][1].b = 10;
    }
}
