// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingGlobalLibrary.sol";

contract UsingGlobalLibraryTest {
    UsingGlobalLibrary c;

    function setUp() public {
        c = new UsingGlobalLibrary();
    }

    function test_f() public {
        (T r1, T r2) = c.f();
        // r1 = 0.inc().inc() = 2
        assert(T.unwrap(r1) == 2);
        // r2 = r1.dec() = 1
        assert(T.unwrap(r2) == 1);
    }
}
