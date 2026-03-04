// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineAssemblyIf {
    function f(uint256 a) public returns (uint256 b) {
        assembly {
            if gt(a, 1) {
                b := 2
            }
        }
    }
}
