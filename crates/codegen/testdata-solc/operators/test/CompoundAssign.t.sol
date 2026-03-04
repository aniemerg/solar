// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CompoundAssign.sol";

contract CompoundAssignTest {
    function test_CompoundAssign() public {
        test c = new test();
        assert(c.f(0, 6) == 7);
        assert(c.f(1, 3) == 0x23);
        assert(c.f(2, 25) == 0x0746);
        assert(c.f(3, 69) == 396613);
        assert(c.f(4, 84) == 137228105);
        assert(c.f(5, 2) == 0xcc7c5e28);
        assert(c.f(6, 51) == 1121839760671);
        assert(c.f(7, 48) == 408349672884251);
    }
}
