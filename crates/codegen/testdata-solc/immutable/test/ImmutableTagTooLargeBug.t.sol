// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ImmutableTagTooLargeBug.sol";

contract ImmutableTagTooLargeBugTest {
    function test_ImmutableTagTooLargeBug() public {
        // x starts at 1, then x-- --x makes it -1
        // y starts at 3, then y++ ++y --y makes it 4
        ImmutableTagTooLargeBug c = new ImmutableTagTooLargeBug();
        (int rv1, int rv2) = c.f();
        assert(rv1 == -1);
        assert(rv2 == 1);
    }
}
