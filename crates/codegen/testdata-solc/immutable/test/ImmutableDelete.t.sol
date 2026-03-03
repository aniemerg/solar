// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ImmutableDelete.sol";

contract ImmutableDeleteTest {
    function test_ImmutableDelete() public {
        ImmutableDelete c = new ImmutableDelete();
        assert(c.a() == 0);
        assert(c.b() == 0);
        assert(c.c() == 0);
    }
}
