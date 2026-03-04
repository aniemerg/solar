// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CallAttachedLibraryOnString.sol";

contract CallAttachedLibraryOnStringTest {
    CallAttachedLibraryOnString c;

    function setUp() public {
        c = new CallAttachedLibraryOnString();
    }

    function test_f_returns_3() public {
        assert(c.f() == 3);
    }

    function test_g_returns_3() public {
        assert(c.g() == 3);
    }
}
