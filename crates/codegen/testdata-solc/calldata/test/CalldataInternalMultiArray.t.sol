// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataInternalMultiArray.sol";

contract CalldataInternalMultiArrayTest {
    CalldataInternalMultiArray c;

    function setUp() public {
        c = new CalldataInternalMultiArray();
    }

    function test_CalldataInternalMultiArray() public {
        (uint256 a, uint256 b) = c.run();
        assert(a == 7);
        assert(b == 8);
    }
}
