// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// This tests that the compiler knows the correct size of the function on the stack.
contract ArrayPopIsolated {
    uint256[] data;

    function runTest() public returns (uint256 x) {
        x = 2;
        data.pop;
        x = 3;
    }
}
