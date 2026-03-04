// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Enums {
    enum E { A, B }
    function f(E e) public pure returns (uint x) {
        assembly { x := e }
    }
}
