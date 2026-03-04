// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayOfFunctionExternalStorageToStorageDynamicDifferentMutability.sol";

contract ArrayOfFunctionExternalStorageDifferentMutabilityTest {
    function test_ArrayOfFunctionExternalStorageDifferentMutability() public {
        ArrayOfFunctionExternalStorageToStorageDynamicDifferentMutability c = new ArrayOfFunctionExternalStorageToStorageDynamicDifferentMutability();
        // copyExternalStorageArraysOfFunctionType() -> true
        assert(c.copyExternalStorageArraysOfFunctionType() == true);
        // copyInternalArrayOfFunctionType() -> true
        assert(c.copyInternalArrayOfFunctionType() == true);
    }
}
