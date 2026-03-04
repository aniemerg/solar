// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayOfFunctionExternalStorageToStorageDynamic.sol";

contract ArrayOfFunctionExternalStorageToStorageDynamicTest {
    function test_ArrayOfFunctionExternalStorageToStorageDynamic() public {
        ArrayOfFunctionExternalStorageToStorageDynamic c = new ArrayOfFunctionExternalStorageToStorageDynamic();
        // copyExternalStorageArrayOfFunctionType() -> true
        assert(c.copyExternalStorageArrayOfFunctionType() == true);
        // copyInternalArrayOfFunctionType() -> true
        assert(c.copyInternalArrayOfFunctionType() == true);
    }
}
