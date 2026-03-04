// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MultislotStructAllocation.sol";

contract MultislotStructAllocationTest {
    MultislotStructAllocation c;

    function setUp() public {
        c = new MultislotStructAllocation();
    }

    function test_MultislotStructAllocation() public {
        assert(c.f() == 2);
    }
}
