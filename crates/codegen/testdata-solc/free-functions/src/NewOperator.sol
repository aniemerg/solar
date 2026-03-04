// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    uint public x = 2;
}

function test() returns (uint) {
    return (new C()).x();
}

contract NewOperator {
    function f() public returns (uint) {
        return test();
    }
}
