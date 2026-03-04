// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BreakInModifier {
    uint256 public x;
    modifier run() {
        for (uint256 i = 0; i < 10; i++) {
            _;
            if (i == 1)
                break;
        }
    }

    function f() public run {
        uint256 k = x;
        uint256 t = k + 1;
        x = t;
    }
}
