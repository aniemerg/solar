// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ImmutableGetter.sol";

contract ImmutableGetterTest {
    function test_ImmutableGetter() public {
        ImmutableGetter c = new ImmutableGetter();
        assert(c.x() == 1);
    }
}
