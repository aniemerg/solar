// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayCopyNestedArray {
    uint256[4][] a;
    uint256[10][] b;
    uint256[][] c;

    function runTest(uint256[2][] calldata d) external returns (uint256) {
        a = d;
        b = a;
        c = b;
        return c[1][1] | c[1][2] | c[1][3] | c[1][4];
    }
}
