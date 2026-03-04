// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyStorageStorageDynamicDynamic.sol";

contract ArrayCopyStorageStorageDynamicDynamicTest {
    function test_ArrayCopyStorageStorageDynamicDynamic() public {
        ArrayCopyStorageStorageDynamicDynamic c = new ArrayCopyStorageStorageDynamicDynamic();
        // test() -> 5, 4
        (uint256 x, uint256 y) = c.runTest();
        assert(x == 5);
        assert(y == 4);
    }
}
