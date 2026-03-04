// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyStorageStorageDifferentBase.sol";

contract ArrayCopyStorageStorageDifferentBaseTest {
    function test_ArrayCopyStorageStorageDifferentBase() public {
        ArrayCopyStorageStorageDifferentBase c = new ArrayCopyStorageStorageDifferentBase();
        // test() -> 5, 4
        (uint256 x, uint256 y) = c.runTest();
        assert(x == 5);
        assert(y == 4);
    }
}
