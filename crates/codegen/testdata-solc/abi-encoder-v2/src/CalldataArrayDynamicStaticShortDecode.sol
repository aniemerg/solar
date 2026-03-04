// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayDynamicStaticShortDecode {
    function f(uint256[][2][] calldata x) external returns (uint256) {
        x[0]; // trigger bounds checks
        return 23;
    }
}
