// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingForStorageStructs.sol";

contract UsingForStorageStructsTest {
    UsingForStorageStructs c;

    function setUp() public {
        c = new UsingForStorageStructs();
    }

    function test_g() public {
        // g() -> 7, 7
        (uint256 a, uint256 b) = c.g();
        assert(a == 7);
        assert(b == 7);
    }
}
