// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayPopEmptyException {
    uint256[] data;

    function runTest() public returns (bool) {
        data.pop();
        return true;
    }
}
