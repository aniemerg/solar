// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SkipDynamicTypesForStaticArraysWithDynamicElements {
    struct S {
        bool[] b;
    }

    function f() public returns (uint256, bool[][2] memory, S[2] memory, uint256) {
        return (5, [new bool[](1), new bool[](2)], [S(new bool[](2)), S(new bool[](5))], 6);
    }

    function g() public returns (uint256, uint256) {
        (uint256 a, , , uint256 b) = this.f();
        return (a, b);
    }
}
