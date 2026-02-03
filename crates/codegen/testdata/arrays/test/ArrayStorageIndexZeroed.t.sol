// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayStorageIndexZeroed.sol";

contract ArrayStorageIndexZeroedTest {
    ArrayStorageIndexZeroed c;

    function setUp() public {
        c = new ArrayStorageIndexZeroed();
    }

    function test_ArrayStorageIndexZeroed() public {
        c.checkZeroedIndices(1);
        c.checkZeroedIndices(5);
        c.checkZeroedIndices(10);
        c.checkZeroedIndices(15);
    }
}
