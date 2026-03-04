// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReturnDoesNotSkipModifier {
    uint256 public x;
    modifier setsx {
        _;
        x = 9;
    }

    function f() public setsx returns (uint256) {
        return 2;
    }
}
