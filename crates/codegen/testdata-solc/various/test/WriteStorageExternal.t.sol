// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/WriteStorageExternal.sol";

contract WriteStorageExternalTest {
    WriteStorageExternal c;

    function setUp() public {
        c = new WriteStorageExternal();
    }

    function test_f() public {
        assert(c.f() == 3);
    }

    function test_g() public {
        assert(c.g() == 8);
    }

    function test_h() public {
        assert(c.h() == 12);
    }
}
