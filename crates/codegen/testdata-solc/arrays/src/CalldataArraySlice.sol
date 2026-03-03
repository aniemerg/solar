// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract CalldataArraySlice {
    function f(uint256[] calldata c) internal pure returns (uint256 a, uint256 b) {
        return (c.length, c[0]);
    }

    function g(uint256[] calldata c) external pure returns (uint256 a, uint256 b) {
        return f(c);
    }

    function h(uint256[] calldata c, uint256 start, uint256 end) external pure returns (uint256 a, uint256 b) {
        return f(c[start:end]);
    }
}
