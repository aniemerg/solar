// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryStrayValues.sol";

contract LibraryStrayValuesTest {
    LibraryStrayValues c;

    function setUp() public {
        c = new LibraryStrayValues();
    }

    function test_f() public {
        // f(uint256): 33 -> 0x2a (42)
        assert(c.f(33) == 42);
    }
}
