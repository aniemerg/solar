// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract A {
    function f() public mod returns (bool r) {
        return true;
    }

    modifier mod virtual;
}


contract FunctionModifierEmpty is A {
    modifier mod override {
        if (false) _;
    }
}
