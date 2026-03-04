// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DecayedTuple.sol";

contract DecayedTupleTest {
    DecayedTuple c;

    function setUp() public {
        c = new DecayedTuple();
    }

    function test_f() public {
        assert(c.f() == 2);
    }
}
