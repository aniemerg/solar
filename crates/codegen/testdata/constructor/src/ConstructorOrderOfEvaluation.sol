// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    constructor(uint256) {}
}

contract B {
    constructor(uint256) {}
}

contract C {
    constructor(uint256) {}
}

contract D {
    constructor(uint256) {}
}

contract ConstructorOrderOfEvaluation is D, C, B, A {
    uint256[] x;

    function f(uint256 _x) internal returns (uint256) {
        x.push(_x);
        return _x;
    }

    function g() public view returns (uint256[] memory) {
        return x;
    }

    constructor() A(f(1)) C(f(2)) B(f(3)) D(f(4)) {}
}
