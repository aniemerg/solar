// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function() internal storedFn;

    bool flag;

    constructor() {
        if (!flag) {
            flag = true;
            function() internal invalid;
            storedFn = invalid;
            storedFn();
        }
    }

    function f() public pure {}
}

contract InvalidStoredInConstructor {
    function f() public {
        new C();
    }
}
