// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryReferencesPreserve.sol";

contract LibraryReferencesPreserveTest {
    LibraryReferencesPreserve c;

    function setUp() public {
        c = new LibraryReferencesPreserve();
    }

    function test_aSum() public view {
        // aSum() -> 4 (1 + 2 + 1 = 4 using L1)
        assert(c.aSum() == 4);
    }

    function test_bSum() public view {
        // bSum() -> 5 (1 + 2 + 2 = 5 using L2)
        assert(c.bSum() == 5);
    }
}
