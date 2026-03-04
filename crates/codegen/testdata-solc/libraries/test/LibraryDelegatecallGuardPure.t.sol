// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryDelegatecallGuardPure.sol";

contract LibraryDelegatecallGuardPureTest {
    LibraryDelegatecallGuardPure c;

    function setUp() public {
        c = new LibraryDelegatecallGuardPure();
    }

    function test_f() public view {
        // f() -> 23
        assert(c.f() == 23);
    }

    function test_g() public {
        // g() -> true, 23
        (bool success, uint256 val) = c.g();
        assert(success == true);
        assert(val == 23);
    }

    function test_h() public {
        // h() -> true, 23
        (bool success, uint256 val) = c.h();
        assert(success == true);
        assert(val == 23);
    }
}
