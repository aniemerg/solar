// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CodeAccessPadding.sol";

contract CodeAccessPaddingTest {
    CodeAccessPadding c;

    function setUp() public {
        c = new CodeAccessPadding();
    }

    function test_diff() public view {
        // Memory allocations are padded to multiples of 32 bytes
        assert(c.diff() == 0);
    }
}
