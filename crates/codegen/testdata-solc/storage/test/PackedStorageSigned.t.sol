// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PackedStorageSigned.sol";

contract PackedStorageSignedTest {
    PackedStorageSigned c;

    function setUp() public {
        c = new PackedStorageSigned();
    }

    function test_PackedStorageSigned() public {
        (uint256 x1, uint256 x2, uint256 x3, uint256 x4) = c.test();
        assert(x1 == uint256(int256(-2)));
        assert(x2 == 4);
        assert(x3 == uint256(int256(-112)));
        assert(x4 == 0);
    }
}
