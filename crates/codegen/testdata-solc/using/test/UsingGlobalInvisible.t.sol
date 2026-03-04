// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingGlobalInvisible.sol";

contract UsingGlobalInvisibleTest {
    UsingGlobalInvisible c;

    function setUp() public {
        c = new UsingGlobalInvisible();
    }

    function test_test() public {
        // test() -> 3 (0.inc().inc() = 2, then .inc().inc().dec() = 3)
        assert(c.test() == 3);
    }
}
