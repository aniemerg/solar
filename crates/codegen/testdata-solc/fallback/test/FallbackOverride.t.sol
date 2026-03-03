// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FallbackOverride.sol";

contract FallbackOverrideTest {
    function test_FallbackOverride() public {
        FallbackOverride c = new FallbackOverride();

        // f() calls fallback with "abc", override returns "xyz"
        (bool success, bytes memory retval) = c.f();
        assert(success);
        assert(retval.length == 3);
        assert(keccak256(retval) == keccak256(bytes("xyz")));
    }
}
