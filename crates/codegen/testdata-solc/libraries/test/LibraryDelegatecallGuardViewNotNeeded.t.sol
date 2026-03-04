// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryDelegatecallGuardViewNotNeeded.sol";

contract LibraryDelegatecallGuardViewNotNeededTest {
    LibraryDelegatecallGuardViewNotNeeded c;

    function setUp() public {
        c = new LibraryDelegatecallGuardViewNotNeeded();
    }

    function test_f() public view {
        // f() -> 84
        assert(c.f() == 84);
    }

    function test_g() public {
        // g() -> true, 84
        (bool success, uint256 val) = c.g();
        assert(success == true);
        assert(val == 84);
    }

    function test_h() public {
        // h() -> true, 84
        (bool success, uint256 val) = c.h();
        assert(success == true);
        assert(val == 84);
    }
}
