// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataInternalMultiFixedArray.sol";

contract CalldataInternalMultiFixedArrayTest {
    CalldataInternalMultiFixedArray c;

    function setUp() public {
        c = new CalldataInternalMultiFixedArray();
    }

    function test_CalldataInternalMultiFixedArray() public {
        (uint256 a, uint256 b) = c.run();
        assert(a == 7);
        assert(b == 8);
    }
}
