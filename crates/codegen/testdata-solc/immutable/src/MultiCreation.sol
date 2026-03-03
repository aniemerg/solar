// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiCreationA {
    uint immutable a;

    constructor() {
        a = 7;
    }

    function f() public view returns (uint) {
        return a;
    }
}

contract MultiCreationB {
    uint immutable a;

    constructor() {
        a = 5;
    }

    function f() public view returns (uint) {
        return a;
    }
}

contract MultiCreation {
    uint immutable a;
    uint public x;
    uint public y;

    constructor() {
        a = 3;
        x = (new MultiCreationA{salt: hex"00"}()).f();
        y = (new MultiCreationB{salt: hex"00"}()).f();
    }

    function f() public returns (uint256, uint, uint) {
        return (a, (new MultiCreationA{salt: hex"01"}()).f(), (new MultiCreationB{salt: hex"01"}()).f());
    }
}
