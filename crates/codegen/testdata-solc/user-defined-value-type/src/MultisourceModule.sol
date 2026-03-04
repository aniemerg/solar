// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Adapted from multi-source module test: inlined in single file
type MyInt is int;

contract MultisourceModule {
    function f(int x) public pure returns (MyInt) { return MyInt.wrap(x); }
    function g(MyInt x) public pure returns (int) { return MyInt.unwrap(x); }
}
