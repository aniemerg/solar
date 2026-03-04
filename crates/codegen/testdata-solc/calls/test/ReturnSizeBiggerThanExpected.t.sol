// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ReturnSizeBiggerThanExpected.sol";

contract ReturnSizeBiggerThanExpectedTest {
    ReturnSizeBiggerThanExpected c;

    function setUp() public {
        c = new ReturnSizeBiggerThanExpected();
    }

    function test_run_allocates_memory_for_returned_data() public {
        // When callee returns more data than expected, the free memory pointer advances.
        // The actual amount depends on codegen (YUL IR allocates 0x20, legacy allocates 640).
        // We just verify that memory was allocated (non-zero advance).
        uint diff = c.run();
        assert(diff > 0);
    }
}
