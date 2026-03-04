// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BlobhashShadowResolution.sol";

contract BlobhashShadowResolutionTest {
    function test_BlobhashShadowResolution() public {
        BlobhashShadowResolution c = new BlobhashShadowResolution();
        assert(c.f() == bytes32(uint256(3)));
    }
}
