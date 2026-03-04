// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionNameClash {
    function f() public pure returns (uint r) {
        assembly { function f() -> x { x := 1 } r := f() }
    }
    function g() public pure returns (uint r) {
        assembly { function f() -> x { x := 2 } r := f() }
    }
}
