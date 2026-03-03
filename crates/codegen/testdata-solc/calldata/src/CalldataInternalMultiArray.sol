// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataInternalMultiArray {
    function g(uint256[][2] calldata s) internal pure returns (uint256, uint256[] calldata) {
        return (s[0][1], s[1]);
    }

    function f(uint256, uint256[][2] calldata s, uint256) external pure returns (uint256, uint256) {
        (uint256 x, uint256[] calldata y) = g(s);
        return (x, y[0]);
    }

    function run() public returns (uint256, uint256) {
        uint256[][2] memory x;
        x[0] = new uint256[](2);
        x[1] = new uint256[](2);
        x[0][1] = 7;
        x[1][0] = 8;
        return this.f(4, x, 5);
    }
}
