// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EmptyNonemptyEmpty.sol";

contract EmptyNonemptyEmptyTest {
    EmptyNonemptyEmpty c;

    function setUp() public {
        c = new EmptyNonemptyEmpty();
    }

    function test_EmptyNonemptyEmpty() public {
        c.set("abc");
        assert(!c.storageEmpty());

        c.set("");
        assert(c.storageEmpty());

        c.set("1234567890123456789012345678901");
        assert(!c.storageEmpty());

        c.set("123456789012345678901234567890123456");
        assert(!c.storageEmpty());

        c.set("abc");
        assert(!c.storageEmpty());

        c.set("");
        assert(c.storageEmpty());

        c.set("abc");
        assert(!c.storageEmpty());

        c.set("123456789012345678901234567890123456");
        assert(!c.storageEmpty());

        c.set("");
        assert(c.storageEmpty());
    }
}
