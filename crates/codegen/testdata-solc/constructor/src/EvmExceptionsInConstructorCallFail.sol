// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    constructor() {
        address(this).call("123");
    }
}

contract B {
    uint256 public test = 1;

    function testIt() public {
        A a = new A();
        ++test;
    }
}
