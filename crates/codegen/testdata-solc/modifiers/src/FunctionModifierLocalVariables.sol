// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionModifierLocalVariables {
    modifier mod1 {
        uint8 a = 1;
        uint8 b = 2;
        _;
    }
    modifier mod2(bool a) {
        if (a) return;
        else _;
    }

    function f(bool a) public mod1 mod2(a) returns (uint256 r) {
        return 3;
    }
}
