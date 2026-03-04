// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingOfString {
    mapping(string => uint8[3]) public x;
    constructor() {
        x["abc"][0] = 1;
        x["abc"][2] = 3;
        x["abc"][1] = 2;
        x["def"][1] = 9;
    }
}
