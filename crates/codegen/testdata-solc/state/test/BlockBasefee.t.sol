// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BlockBasefee.sol";

contract BlockBasefeeTest {
    function test_BlockBasefee() public {
        BlockBasefee c = new BlockBasefee();
        // block.basefee and assembly basefee() return the same value
        assert(c.f() == c.g());
    }
}
