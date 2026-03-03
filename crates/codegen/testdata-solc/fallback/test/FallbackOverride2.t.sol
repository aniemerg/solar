// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FallbackOverride2.sol";

contract FallbackOverride2Test {
    function test_FallbackOverride2() public {
        FallbackOverride2 c = new FallbackOverride2();

        // f() calls fallback (no-arg override), returns empty bytes
        (bool success, bytes memory retval) = c.f();
        assert(success);
        assert(retval.length == 0);
    }
}
