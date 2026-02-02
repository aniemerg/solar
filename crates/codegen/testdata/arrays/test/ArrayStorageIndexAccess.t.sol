// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayStorageIndexAccess.sol";

contract ArrayStorageIndexAccessTest {
    ArrayStorageIndexAccess c;

    function setUp() public {
        c = new ArrayStorageIndexAccess();
    }

    function test_ArrayStorageIndexAccess() public {
        c.testIndices(0);
        c.testIndices(1);
        c.testIndices(5);
        c.testIndices(10);
        c.testIndices(128);
    }
}
