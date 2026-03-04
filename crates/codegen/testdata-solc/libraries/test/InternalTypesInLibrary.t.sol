// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalTypesInLibrary.sol";

contract InternalTypesInLibraryTest {
    InternalTypesInLibrary c;

    function setUp() public {
        c = new InternalTypesInLibrary();
    }

    function test_f() public {
        // f() -> 4, 0x11 (17)
        (uint256 a, uint256 b) = c.f();
        assert(a == 4);
        assert(b == 17);
    }
}
