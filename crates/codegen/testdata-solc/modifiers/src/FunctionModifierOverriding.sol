// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    function f() public mod returns (bool r) {
        return true;
    }

    modifier mod virtual {
        _;
    }
}


contract FunctionModifierOverriding is A {
    modifier mod override {
        if (false) _;
    }
}
