// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract A {
    constructor (mapping (uint => uint) storage m) {
        m[5] = 20;
    }
}

contract MappingAbstractConstructorParam is A {
    mapping (uint => uint) public m;

    constructor() A(m) {
    }
}
