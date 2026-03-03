// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayStoragePushEmpty.sol";

contract ArrayStoragePushEmptyTest {
    ArrayStoragePushEmpty c;

    function setUp() public {
        c = new ArrayStoragePushEmpty();
    }

    function test_ArrayStoragePushEmpty() public {
        c.pushEmpty(128);
    }
}
