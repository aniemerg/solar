// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstructorArgumentsExternal {
    bytes3 name;
    bool flag;

    constructor(bytes3 x, bool f) {
        name = x;
        flag = f;
    }

    function getName() public view returns (bytes3 ret) {
        return name;
    }

    function getFlag() public view returns (bool ret) {
        return flag;
    }
}
