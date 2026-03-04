// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryDelegatecallGuardViewStaticcall.sol";

contract LibraryDelegatecallGuardViewStaticcallTest {
    LibraryDelegatecallGuardViewStaticcall c;

    function setUp() public {
        c = new LibraryDelegatecallGuardViewStaticcall();
    }

    function test_f() public view {
        // f() -> 42
        assert(c.f() == 42);
    }

    function test_g() public {
        // g() -> true, 42
        (bool success, uint256 val) = c.g();
        assert(success == true);
        assert(val == 42);
    }

    function test_h() public {
        // h() -> true, 42
        (bool success, uint256 val) = c.h();
        assert(success == true);
        assert(val == 42);
    }
}
