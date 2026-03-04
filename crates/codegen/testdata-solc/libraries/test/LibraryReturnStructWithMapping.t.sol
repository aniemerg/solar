// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryReturnStructWithMapping.sol";

contract LibraryReturnStructWithMappingTest {
    LibraryReturnStructWithMapping c;

    function setUp() public {
        c = new LibraryReturnStructWithMapping();
    }

    function test_f() public {
        // f() -> 123
        assert(c.f() == 123);
    }
}
