// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TupleAssignMultiSlotGrow.sol";

contract TupleAssignMultiSlotGrowTest {
    TupleAssignMultiSlotGrow c;

    function setUp() public {
        c = new TupleAssignMultiSlotGrow();
    }

    function test_f() public view {
        // f() -> 0x30, 0x31, 0x32 ('0', '1', '2')
        (uint a, uint b, uint cv) = c.f();
        assert(a == 0x30);
        assert(b == 0x31);
        assert(cv == 0x32);
    }
}
