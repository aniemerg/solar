// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayStorageIndexAccess.sol";

contract ArrayStorageIndexAccessTest {
    ArrayStorageIndexAccess c;

    function setUp() public {
        c = new ArrayStorageIndexAccess();
    }

    function test_ArrayStorageIndexAccess() public {
        c.checkIndices(0);
        c.checkIndices(1);
        c.checkIndices(5);
        c.checkIndices(10);
        c.checkIndices(128);
    }
}
