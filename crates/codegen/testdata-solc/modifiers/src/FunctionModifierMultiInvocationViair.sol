// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionModifierMultiInvocationViair {
    modifier repeat(bool twice) {
        if (twice) _;
        _;
    }

    function f(bool twice) public repeat(twice) returns (uint256 r) {
        r += 1;
    }
}
