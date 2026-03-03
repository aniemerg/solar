// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    uint immutable public x = 1;
    uint public y;

    constructor() {
        y = this.x();
    }
}

contract GetterCallInConstructor {
    function f() public returns (bool) {
        try new A() {
            return false;
        } catch {
            return true;
        }
    }
}
