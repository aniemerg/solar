// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingReturnsInLibrary.sol";

contract MappingReturnsInLibraryTest {
    MappingReturnsInLibrary c;

    function setUp() public {
        c = new MappingReturnsInLibrary();
    }

    function test_setGetA() public {
        // set true (a mapping)
        assert(c.set(true, 1, 42) == 0);
        assert(c.set(true, 2, 84) == 0);
        assert(c.set(true, 21, 7) == 0);
        // set false (b mapping)
        assert(c.set(false, 1, 10) == 0);
        assert(c.set(false, 2, 11) == 0);
        assert(c.set(false, 21, 12) == 0);
        // get a values
        assert(c.get(true, 0) == 0);
        assert(c.get(true, 1) == 42);
        assert(c.get(true, 2) == 84);
        assert(c.get(true, 21) == 7);
        assert(c.get_a(1) == 42);
        assert(c.get_a(2) == 84);
        // get b values
        assert(c.get(false, 1) == 10);
        assert(c.get(false, 2) == 11);
        assert(c.get(false, 21) == 12);
        assert(c.get_b(1) == 10);
        assert(c.get_b(2) == 11);
    }

    function test_overwrite() public {
        c.set(true, 1, 42);
        c.set(true, 2, 84);
        c.set(true, 21, 7);
        c.set(false, 1, 10);
        c.set(false, 2, 11);
        c.set(false, 21, 12);
        // overwrite
        assert(c.set(true, 1, 21) == 42);
        assert(c.set(true, 2, 42) == 84);
        assert(c.set(true, 21, 14) == 7);
        assert(c.set(false, 1, 30) == 10);
        assert(c.set(false, 2, 31) == 11);
        assert(c.set(false, 21, 32) == 12);
        // final checks
        assert(c.get_a(1) == 21);
        assert(c.get_a(2) == 42);
        assert(c.get_a(21) == 14);
        assert(c.get_b(1) == 30);
        assert(c.get_b(2) == 31);
        assert(c.get_b(21) == 32);
    }
}
