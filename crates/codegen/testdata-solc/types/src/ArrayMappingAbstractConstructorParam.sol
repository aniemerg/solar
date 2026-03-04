// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract A {
    constructor (mapping (uint => uint) [] storage m) {
        m.push();
        m[0][1] = 2;
    }
}

contract ArrayMappingAbstractConstructorParam is A {
    mapping(uint => mapping (uint => uint) []) public m;

    constructor() A(m[1]) {
    }
}
