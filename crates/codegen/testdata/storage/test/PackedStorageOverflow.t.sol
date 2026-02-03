// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PackedStorageOverflow.sol";

contract PackedStorageOverflowTest {
    PackedStorageOverflow c;

    function setUp() public {
        c = new PackedStorageOverflow();
    }

    function test_PackedStorageOverflow() public {
        (uint256 x, uint256 cval, uint256 b, uint256 a) = c.f();
        assert(x == 0x1234);
        assert(cval == 0);
        assert(b == 0);
        assert(a == 0xfffe);
    }
}
