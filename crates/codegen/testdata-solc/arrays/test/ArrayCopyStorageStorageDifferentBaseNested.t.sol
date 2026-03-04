// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyStorageStorageDifferentBaseNested.sol";

contract ArrayCopyStorageStorageDifferentBaseNestedTest {
    function test_ArrayCopyStorageStorageDifferentBaseNested() public {
        ArrayCopyStorageStorageDifferentBaseNested c = new ArrayCopyStorageStorageDifferentBaseNested();
        // test() -> 3, 4
        (uint256 x, uint120 y) = c.runTest();
        assert(x == 3);
        assert(y == 4);
    }
}
