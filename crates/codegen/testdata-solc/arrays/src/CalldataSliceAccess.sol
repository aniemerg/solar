// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataSliceAccess {
    function f(uint256[] calldata x, uint256 start, uint256 end) external pure {
        x[start:end];
    }
    function g(uint256[] calldata x, uint256 start, uint256 end, uint256 index) external pure returns (uint256, uint256, uint256) {
        return (x[start:end][index], x[start:][0:end-start][index], x[:end][start:][index]);
    }
}
