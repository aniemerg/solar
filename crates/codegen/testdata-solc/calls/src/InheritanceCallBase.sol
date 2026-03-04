// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InheritanceCallBaseBase {
    function f(uint n) public returns (uint) {
        return 2 * n;
    }
}

contract InheritanceCallBase is InheritanceCallBaseBase {
    function g(uint n) public returns (uint) {
        return f(n);
    }
}
