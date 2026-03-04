// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InheritanceCallBaseExplicitBase {
    function f(uint n) public returns (uint) {
        return 2 * n;
    }
}

contract InheritanceCallBaseExplicit is InheritanceCallBaseExplicitBase {
    function g(uint n) public returns (uint) {
        return InheritanceCallBaseExplicitBase.f(n);
    }
}
