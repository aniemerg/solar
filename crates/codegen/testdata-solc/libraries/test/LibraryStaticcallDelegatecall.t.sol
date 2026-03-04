// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryStaticcallDelegatecall.sol";

contract LibraryStaticcallDelegatecallTest {
    LibraryStaticcallDelegatecall c;

    function setUp() public {
        c = new LibraryStaticcallDelegatecall();
    }

    function test_f() public {
        // f() -> 1
        assert(c.f() == 1);
    }
}
