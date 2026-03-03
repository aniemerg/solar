// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Helper {
    bytes3 name;
    bool flag;

    constructor(bytes3 x, bool f) {
        name = x;
        flag = f;
    }

    function getName() public returns (bytes3 ret) {
        return name;
    }

    function getFlag() public returns (bool ret) {
        return flag;
    }
}

contract ConstructorArgumentsInternal {
    Helper h;

    constructor() {
        h = new Helper("abc", true);
    }

    function getFlag() public returns (bool ret) {
        return h.getFlag();
    }

    function getName() public returns (bytes3 ret) {
        return h.getName();
    }
}
