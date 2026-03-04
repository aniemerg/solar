// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ByteArrayPopEmptyException {
    uint256 a;
    uint256 b;
    uint256 c;
    bytes data;

    function runTest() public returns (bool) {
        data.pop();
        return true;
    }
}
