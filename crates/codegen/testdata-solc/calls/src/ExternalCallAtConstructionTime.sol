// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Tests that calling external functions on self during construction reverts
// because extcodesize check fails (legacy bytecode behavior).

contract T {
    constructor() { this.f(); }
    function f() external {}
}

contract U {
    constructor() { this.f(); }
    function f() external returns (uint) {}
}

contract ExternalCallAtConstructionTime {
    function f(uint c) external returns (uint) {
        if (c == 0) new T();
        else if (c == 1) new U();
        return 1 + c;
    }
}
