// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OverloadedFunctionCallWithIfElse {
    function f(uint256 a, uint256 b) public returns (uint256 d) {
        return a + b;
    }

    function f(uint256 k) public returns (uint256 d) {
        return k;
    }

    function g(bool flag) public returns (uint256 d) {
        if (flag) return f(3);
        else return f(3, 7);
    }
}
