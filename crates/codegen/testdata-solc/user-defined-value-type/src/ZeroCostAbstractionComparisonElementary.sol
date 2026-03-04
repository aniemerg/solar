// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZeroCostAbstractionComparisonElementary {
    int x;
    function setX(int _x) external {
        x = _x;
    }
    function getX() view external returns (int) {
        return x;
    }
    function add(int a, int b) pure external returns (int) {
        return a + b;
    }
}
