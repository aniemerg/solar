// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayTwoDimensional {
    function getLength(uint256[][2] calldata a) external pure returns (uint256) {
        return a.length;
    }
    function getInnerLength(uint256[][2] calldata a, uint256 i) external pure returns (uint256) {
        return a[i].length;
    }
    function getElement(uint256[][2] calldata a, uint256 i, uint256 j) external pure returns (uint256) {
        return a[i][j];
    }
    function reenc(uint256[][2] calldata a, uint256 i, uint256 j) external returns (uint256) {
        return this.getElement(a, i, j);
    }
}
