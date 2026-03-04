// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelectorTernary {
    function f() public {}
    function g() public {}
    function h(bool c) public view returns (bytes4) {
        return (c ? this.f : this.g).selector;
    }
}
