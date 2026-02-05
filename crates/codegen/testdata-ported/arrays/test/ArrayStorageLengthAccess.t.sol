// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayStorageLengthAccess.sol";

contract ArrayStorageLengthAccessTest {
    ArrayStorageLengthAccess c;

    function setUp() public {
        c = new ArrayStorageLengthAccess();
    }

    function test_ArrayStorageLengthAccess() public {
        assert(c.setGetLength(0) == 0);
        assert(c.setGetLength(1) == 1);
        assert(c.setGetLength(10) == 10);
        assert(c.setGetLength(20) == 20);
        assert(c.setGetLength(0xff) == 0xff);
    }
}
