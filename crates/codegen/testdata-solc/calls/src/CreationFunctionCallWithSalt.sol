// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    uint public i;
    constructor(uint newI) {
        i = newI;
    }
}

contract CreationFunctionCallWithSalt {
    C c;
    constructor(uint v) {
        c = new C{salt: "abc"}(v);
    }
    function f() public returns (uint r) {
        return c.i();
    }
}
