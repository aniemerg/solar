// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MultipleInitializations.sol";

contract MultipleInitializationsTest {
    function test_MultipleInitializations() public {
        MultipleInitializationsC c = new MultipleInitializationsC();
        // x accumulates: 1 + 2 + 4 + 8 + 16 + 32 + 64 + 128 = 255 = 0xff
        assert(c.get() == 0xff);
    }
}
