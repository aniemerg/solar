// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UninitializedImmutable.sol";

contract UninitializedImmutableTest {
    function test_UninitializedImmutable() public {
        UninitializedImmutable c = new UninitializedImmutable();
        (uint uv, bool bv, address av) = c.get();
        assert(uv == 0);
        assert(bv == false);
        assert(av == address(0));
    }
}
