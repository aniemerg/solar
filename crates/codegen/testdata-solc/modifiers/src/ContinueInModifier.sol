// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContinueInModifier {
    uint256 public x;
    modifier run() {
        for (uint256 i = 0; i < 10; i++) {
            if (i % 2 == 1) continue;
            _;
        }
    }

    function f() public run {
        uint256 k = x;
        uint256 t = k + 1;
        x = t;
    }
}
