// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScientificNotation {
    function f() public pure returns (uint256) {
        return 2e10 wei;
    }

    function g() public pure returns (uint256) {
        return 200e-2 wei;
    }

    function h() public pure returns (uint256) {
        return 2.5e1;
    }

    function i() public pure returns (int256) {
        return -2e10;
    }

    function j() public pure returns (int256) {
        return -200e-2;
    }

    function k() public pure returns (int256) {
        return -2.5e1;
    }
}
