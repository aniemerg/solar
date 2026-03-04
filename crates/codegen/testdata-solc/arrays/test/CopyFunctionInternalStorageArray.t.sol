// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyFunctionInternalStorageArray.sol";

contract CopyFunctionInternalStorageArrayTest {
    function test_CopyFunctionInternalStorageArray() public {
        CopyFunctionInternalStorageArray c = new CopyFunctionInternalStorageArray();
        // test() -> 7
        assert(c.runTest() == 7);
    }
}
