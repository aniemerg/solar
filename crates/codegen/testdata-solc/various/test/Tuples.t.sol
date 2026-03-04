// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Tuples.sol";

contract TuplesTest {
    Tuples c;

    function setUp() public {
        c = new Tuples();
    }

    function test_f() public {
        assert(c.f() == 0);
    }
}
