// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BlockhashShadowResolution.sol";

contract BlockhashShadowResolutionTest {
    function test_BlockhashShadowResolution() public {
        BlockhashShadowResolution c = new BlockhashShadowResolution();
        assert(c.f() == bytes32(0));
    }
}
