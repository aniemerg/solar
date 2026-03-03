// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FallbackOverrideMulti.sol";

contract FallbackOverrideMultiTest {
    function test_FallbackOverrideMulti() public {
        FallbackOverrideMulti c = new FallbackOverrideMulti();

        // f() calls fallback (no-arg override of both MA and MB), returns empty bytes
        (bool success, bytes memory retval) = c.f();
        assert(success);
        assert(retval.length == 0);
    }
}
