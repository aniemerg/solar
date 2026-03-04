// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    function f() public {}
    function g() public {}
}

contract SelectorTernaryFunctionPointerFromFunctionCall {
    A a = new A();

    function getContract() public view returns (A) {
        return a;
    }

    function run(bool b) public view returns (bytes4) {
        return (b ? getContract().f : getContract().g).selector;
    }
}
