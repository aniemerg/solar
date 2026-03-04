// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LibStray {
    function m(uint256 x, uint256 y) public returns (uint256) { return x * y; }
}

contract LibraryStrayValues {
    function f(uint256 x) public returns (uint256) {
        LibStray;
        LibStray.m;
        return x + 9;
    }
}
