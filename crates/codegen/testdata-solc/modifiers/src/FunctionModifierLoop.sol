// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionModifierLoop {
    modifier repeat(uint256 count) {
        for (uint256 i = 0; i < count; ++i) _;
    }

    function f() public repeat(10) returns (uint256 r) {
        r += 1;
    }
}
