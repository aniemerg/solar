// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    uint public x = 2;
}

function test() returns (bool) {
    return type(C).runtimeCode.length > 20;
}

contract FreeRuntimecode {
    function f() public returns (bool) {
        return test();
    }
}
