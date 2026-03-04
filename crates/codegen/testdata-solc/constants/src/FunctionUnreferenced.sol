// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract B {
    function g() public {}
}

contract FunctionUnreferenced is B {
    bytes4 constant s2 = B.g.selector;

    function f() external pure returns (bytes4) {
        return s2;
    }
}
