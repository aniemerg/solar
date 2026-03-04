// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    function f(uint256 a) public returns (uint256) {
        return 2 * a;
    }
}

contract B {
    function f() public returns (uint256) {
        return 10;
    }
}

contract C is A, B {
    function g() public returns (uint256) {
        return f();
    }

    function h() public returns (uint256) {
        return f(1);
    }
}
