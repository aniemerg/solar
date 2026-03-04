// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyStorageStorageStaticDynamic.sol";

contract ArrayCopyStorageStorageStaticDynamicTest {
    function test_ArrayCopyStorageStorageStaticDynamic() public {
        ArrayCopyStorageStorageStaticDynamic c = new ArrayCopyStorageStorageStaticDynamic();
        // test() -> 9, 4
        (uint256 x, uint256 y) = c.runTest();
        assert(x == 9);
        assert(y == 4);
    }
}
