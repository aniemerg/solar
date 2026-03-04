// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryDelegatecallGuardViewNeeded.sol";

contract LibraryDelegatecallGuardViewNeededTest {
    LibraryDelegatecallGuardViewNeeded c;

    function setUp() public {
        c = new LibraryDelegatecallGuardViewNeeded();
    }

    function test_f() public view {
        // f() -> 1
        assert(c.f() == 1);
    }

    function test_g() public {
        // g() -> true, 1 (delegatecall reads y.length from caller's storage)
        (bool success, uint256 val) = c.g();
        assert(success == true);
        assert(val == 1);
    }

    function test_h() public {
        // h() -> true, 0 (call reads from library's own storage which has no y)
        (bool success, uint256 val) = c.h();
        assert(success == true);
        assert(val == 0);
    }
}
