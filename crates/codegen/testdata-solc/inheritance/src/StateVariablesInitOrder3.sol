// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    uint256 public a = 42;
    uint256 public b;
    uint256 public c;

    constructor(uint256 x) {
        b = a;
        a = x;
    }

    function f(uint256 x) public returns (uint256) {
        c = x * 3;
        return 23;
    }
}

contract B is A {
    uint256 public d = f(a);
    uint256 public e = b;
    uint256 public b_a;
    uint256 public b_b;
    uint256 public b_c;

    constructor() A(17) {
        b_a = a;
        b_b = b;
        b_c = c;
    }
}
