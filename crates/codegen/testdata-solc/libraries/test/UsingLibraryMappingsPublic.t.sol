// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingLibraryMappingsPublic.sol";

contract UsingLibraryMappingsPublicTest {
    UsingLibraryMappingsPublic c;

    function setUp() public {
        c = new UsingLibraryMappingsPublic();
    }

    function test_f() public {
        // f() -> 1, 0, 0x2a, 0x17, 0, 0x63
        (uint256 m10, uint256 m11, uint256 m12, uint256 m20, uint256 m21, uint256 m22) = c.f();
        assert(m10 == 1);
        assert(m11 == 0);
        assert(m12 == 42);
        assert(m20 == 23);
        assert(m21 == 0);
        assert(m22 == 99);
    }
}
