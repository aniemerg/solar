// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingReturnsInLibraryNamed.sol";

contract MappingReturnsInLibraryNamedTest {
    MappingReturnsInLibraryNamed c;

    function setUp() public {
        c = new MappingReturnsInLibraryNamed();
    }

    function test_f() public {
        // f() -> 0, 0x2a, 0, 0, 0x15, 0x54
        // f sets a[1]=42, b[1]=21, then b[2]=84 via returned ref
        (uint256 a0, uint256 a1, uint256 a2, uint256 b0, uint256 b1, uint256 b2) = c.f();
        assert(a0 == 0);
        assert(a1 == 42);
        assert(a2 == 0);
        assert(b0 == 0);
        assert(b1 == 21);
        assert(b2 == 84);
    }

    function test_g() public {
        // g() -> 0, 0x2a, 0, 0, 0x15, 0x11
        // g sets a[1]=42, b[1]=21, then b[2]=17 via m
        (uint256 a0, uint256 a1, uint256 a2, uint256 b0, uint256 b1, uint256 b2) = c.g();
        assert(a0 == 0);
        assert(a1 == 42);
        assert(a2 == 0);
        assert(b0 == 0);
        assert(b1 == 21);
        assert(b2 == 17);
    }
}
