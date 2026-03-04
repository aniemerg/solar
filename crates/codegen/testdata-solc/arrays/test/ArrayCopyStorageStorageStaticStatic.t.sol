// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyStorageStorageStaticStatic.sol";

contract ArrayCopyStorageStorageStaticStaticTest {
    function test_ArrayCopyStorageStorageStaticStatic() public {
        ArrayCopyStorageStorageStaticStatic c = new ArrayCopyStorageStorageStaticStatic();
        // test() -> 8, 0
        (uint256 x, uint256 y) = c.runTest();
        assert(x == 8);
        assert(y == 0);
    }
}
