// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionsCalledByConstructor {
    bytes3 name;
    bool flag;

    constructor() {
        setName("abc");
    }

    function getName() public returns (bytes3 ret) {
        return name;
    }

    function setName(bytes3 _name) private {
        name = _name;
    }
}
