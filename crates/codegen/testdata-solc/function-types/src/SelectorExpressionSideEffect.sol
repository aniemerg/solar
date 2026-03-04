// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelectorExpressionSideEffect {
    uint x;
    function f() public returns (uint256) {
        h().f.selector;
        return x;
    }
    function h() public returns (SelectorExpressionSideEffect) {
        x = 42;
        return this;
    }
}
