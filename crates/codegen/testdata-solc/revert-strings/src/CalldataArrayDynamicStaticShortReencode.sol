// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayDynamicStaticShortReencode {
    function f(uint256[][2][] calldata x) external pure returns (uint256) {
        return 42;
    }
    function g(uint256[][2][] calldata x) external returns (uint256) {
        return this.f(x);
    }
}
