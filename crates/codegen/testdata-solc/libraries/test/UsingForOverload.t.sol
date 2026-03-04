// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingForOverload.sol";

contract UsingForOverloadTest {
    UsingForOverload c;

    function setUp() public {
        c = new UsingForOverload();
    }

    function test_f() public {
        // f(uint256): 7 -> 0x2a (42)
        assert(c.f(7) == 42);
        // x() -> 0x2a
        assert(c.x() == 42);
    }
}
