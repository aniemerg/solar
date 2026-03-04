// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PublicStateOverridding.sol";

contract PublicStateOverriddingTest {
    function test_PublicStateOverridding() public {
        PublicStateOverridding c = new PublicStateOverridding();
        // Initially 0 (state variable default)
        assert(c.test() == 0);
        c.set();
        // After set(), returns 2
        assert(c.test() == 2);
    }
}
