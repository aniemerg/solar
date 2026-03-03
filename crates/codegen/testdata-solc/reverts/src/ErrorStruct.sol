// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct error { uint error; }

contract ErrorStruct {
    error test();
    error _struct;
    function f() public {
        revert test();
    }
    function g(uint x) public returns (uint) {
        _struct.error = x;
        return _struct.error;
    }
}
