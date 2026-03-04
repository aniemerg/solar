// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyStorageStorageDynDyn.sol";

contract ArrayCopyStorageStorageDynDynTest {
    function test_ArrayCopyStorageStorageDynDyn() public {
        ArrayCopyStorageStorageDynDyn c = new ArrayCopyStorageStorageDynDyn();
        // setData1(uint256,uint256,uint256): 10, 5, 4 ->
        c.setData1(10, 5, 4);
        // copyStorageStorage() ->
        c.copyStorageStorage();
        // getData2(uint256): 5 -> 10, 4
        (uint len1, uint val1) = c.getData2(5);
        assert(len1 == 10);
        assert(val1 == 4);
        // setData1(uint256,uint256,uint256): 0, 0, 0 ->
        c.setData1(0, 0, 0);
        // copyStorageStorage() ->
        c.copyStorageStorage();
        // getData2(uint256): 0 -> 0, 0
        (uint len2, uint val2) = c.getData2(0);
        assert(len2 == 0);
        assert(val2 == 0);
    }
}
