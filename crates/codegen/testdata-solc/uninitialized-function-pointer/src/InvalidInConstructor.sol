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
            invalid();
        }
    }

    function f() public pure {}
}

contract InvalidInConstructor {
    function f() public {
        new C();
    }
}
