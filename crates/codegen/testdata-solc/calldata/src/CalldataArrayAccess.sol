// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayAccess {
    function get1(uint256[] calldata x, uint256 i) external pure returns (uint256) {
        return x[i];
    }

    function get2(uint256[][] calldata x, uint256 i, uint256 j) external pure returns (uint256) {
        return x[i][j];
    }
}
