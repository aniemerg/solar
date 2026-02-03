// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InlineArrayIndexAccessInts.sol";

contract InlineArrayIndexAccessIntsTest {
    function test_InlineArrayIndexAccessInts() public {
        InlineArrayIndexAccessInts c = new InlineArrayIndexAccessInts();
        assert(c.f() == 3);
    }
}
