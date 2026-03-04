// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineAssemblyWriteToStack {
    function f() public returns (uint256 r, bytes32 r2) {
        assembly {
            r := 7
            r2 := "abcdef"
        }
    }
}
