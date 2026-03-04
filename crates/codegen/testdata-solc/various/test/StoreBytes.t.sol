// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StoreBytes.sol";

contract StoreBytesTest {
    StoreBytes c;

    function setUp() public {
        c = new StoreBytes();
    }

    function test_save_empty() public {
        assert(c.save() == 24);
    }

    function test_save_with_data() public {
        // calling save() with no extra calldata still returns 24
        assert(c.save() == 24);
    }
}
