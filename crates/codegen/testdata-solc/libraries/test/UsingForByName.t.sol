// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingForByName.sol";

contract UsingForByNameTest {
    UsingForByName c;

    function setUp() public {
        c = new UsingForByName();
    }

    function test_f() public {
        // f(uint256): 7 -> 0x2a (42)
        assert(c.f(7) == 42);
        // x() -> 0x2a (after f sets x.a = 6*7 = 42)
        assert(c.x() == 42);
    }
}
