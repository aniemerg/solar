// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mapping {
    mapping(uint => mapping(uint => uint)) public x;
    constructor() {
        x[1][2] = 3;
    }
}
