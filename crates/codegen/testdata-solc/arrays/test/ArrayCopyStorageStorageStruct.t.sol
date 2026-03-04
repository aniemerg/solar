// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyStorageStorageStruct.sol";

contract ArrayCopyStorageStorageStructTest {
    function test_ArrayCopyStorageStorageStruct() public {
        ArrayCopyStorageStorageStruct c = new ArrayCopyStorageStorageStruct();
        // test() -> 4, 5
        (uint x, uint y) = c.runTest();
        assert(x == 4);
        assert(y == 5);
    }
}
