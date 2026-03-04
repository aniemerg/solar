// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyClearStoragePacked.sol";

contract ArrayCopyClearStoragePackedTest {
    function test_ArrayCopyClearStoragePacked() public {
        ArrayCopyClearStoragePacked c = new ArrayCopyClearStoragePacked();
        assert(c.f() == 0);
        assert(c.g() == 0);
        assert(c.h() == 0);
    }
}
