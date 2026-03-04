// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayDynamicInvalid {
    function f(uint256[][] calldata a) external returns (uint256) {
        return 42;
    }

    function g(uint256[][] calldata a) external returns (uint256) {
        a[0];
        return 42;
    }
}
