// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingLibraryStructs.sol";

contract UsingLibraryStructsTest {
    UsingLibraryStructs c;

    function setUp() public {
        c = new UsingLibraryStructs();
    }

    function test_f() public {
        // f() -> 7, 8
        (uint256 a, uint256 b) = c.f();
        assert(a == 7);
        assert(b == 8);
    }
}
