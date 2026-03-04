// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct Data {
    uint a;
    uint[2] b;
    uint c;
}

contract A {
    function get() public view returns (Data memory) {
        return Data(5, [uint(66), 77], 8);
    }
}

contract B {
    function foo(A _a) public returns (uint) {
        return _a.get().b[1];
    }
}

contract C is B {
    function test() public returns (uint) {
        return foo(new A());
    }
}
