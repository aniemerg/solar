// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StoreInConstructor {
    function() internal storedFn;

    bool flag;

    constructor() {
        function() internal invalid;
        storedFn = invalid;
    }

    function f() public returns (uint) {
        if (flag) return 2;
        flag = true;
        storedFn();
    }
}
