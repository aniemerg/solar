// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayStoragePushPop.sol";

contract ArrayStoragePushPopTest {
    ArrayStoragePushPop c;

    function setUp() public {
        c = new ArrayStoragePushPop();
    }

    function test_ArrayStoragePushPop() public {
        assert(c.setGetLength(0) == 0);
        assert(c.setGetLength(1) == 0);
        assert(c.setGetLength(10) == 0);
        assert(c.setGetLength(20) == 0);
        assert(c.setGetLength(0xff) == 0);
    }
}
