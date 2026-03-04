// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    uint256 data;

    constructor() mod1 {
        data |= 2;
    }

    modifier mod1 virtual {
        data |= 1;
        _;
    }

    function getData() public returns (uint256 r) {
        return data;
    }
}


contract FunctionModifierForConstructor is A {
    modifier mod1 override {
        data |= 4;
        _;
    }
}
