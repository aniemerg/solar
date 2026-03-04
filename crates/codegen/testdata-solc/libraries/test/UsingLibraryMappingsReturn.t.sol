// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingLibraryMappingsReturn.sol";

contract UsingLibraryMappingsReturnTest {
    UsingLibraryMappingsReturn c;

    function setUp() public {
        c = new UsingLibraryMappingsReturn();
    }

    function test_f() public {
        // f() -> 1, 0, 0x2a, 0x17, 0, 0x63
        (uint256 m00, uint256 m01, uint256 m02, uint256 m10, uint256 m11, uint256 m12) = c.f();
        assert(m00 == 1);
        assert(m01 == 0);
        assert(m02 == 42);
        assert(m10 == 23);
        assert(m11 == 0);
        assert(m12 == 99);
    }
}
