// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    uint public x = 7;
    modifier m virtual { x = 2; _; }
}
contract AccessThroughContractName is A {
    modifier m override { x = 1; _; }

    function f() public A.m returns (uint) {
        return 9;
    }
    function g() public m returns (uint) {
        return 10;
    }
}
