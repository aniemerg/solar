// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct S {
    mapping (uint => uint) m;
}

abstract contract A {
    constructor (S storage s) {
        s.m[5] = 16;
    }
}

contract StructMappingAbstractConstructorParam is A {
    mapping(uint => S) m;

    constructor() A(m[1]) {
    }

    function getM(uint a, uint b) external view returns (uint) {
        return m[a].m[b];
    }
}
