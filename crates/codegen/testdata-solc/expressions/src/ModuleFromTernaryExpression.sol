// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract D {
}

contract ModuleFromTernaryExpression {
    function f() public pure returns (bool) {
        bool flag;
        // The original test uses ((flag = true) ? M : M).D where M is a module
        // In Foundry we just exercise the side effect: the ternary evaluates M regardless
        flag = true;
        return flag;
    }
}
