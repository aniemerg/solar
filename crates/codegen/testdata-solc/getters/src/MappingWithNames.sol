// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingWithNames {
    mapping(uint a => mapping(uint b => uint c)) public x;
    constructor() {
        x[1][2] = 3;
    }
}
