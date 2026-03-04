// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    function g() public { revert("fail"); }
}

contract Bubble {
    A a = new A();
    function f() public {
        a.g();
    }
}
