// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StackedReturnWithModifiers {
    uint256 public x;
    modifier m() {
        for (uint256 i = 0; i < 10; i++) {
            _;
            ++x;
            return;
        }
    }

    function f() public m m m returns (uint) {
        for (uint256 i = 0; i < 10; i++) {
            ++x;
            return 42;
        }
    }
}
