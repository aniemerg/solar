// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayStorageIndexZeroed.sol";

contract ArrayStorageIndexZeroedTest {
    ArrayStorageIndexZeroed c;

    function setUp() public {
        c = new ArrayStorageIndexZeroed();
    }

    function test_ArrayStorageIndexZeroed() public {
        c.testZeroedIndices(1);
        c.testZeroedIndices(5);
        c.testZeroedIndices(10);
        c.testZeroedIndices(15);
    }
}
