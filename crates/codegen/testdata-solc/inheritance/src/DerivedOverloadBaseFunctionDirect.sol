// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract B {
    function f() public returns (uint256) {
        return 10;
    }
}

contract C is B {
    function f(uint256 i) public returns (uint256) {
        return 2 * i;
    }

    function g() public returns (uint256) {
        return f(1);
    }
}
