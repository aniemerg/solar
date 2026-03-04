// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CopyFunctionInternalStorageArray {
    function() internal returns (uint)[] x;
    function() internal returns (uint)[] y;

    function runTest() public returns (uint256) {
        x = new function() internal returns (uint)[](10);
        x[9] = a;
        y = x;
        return y[9]();
    }

    function a() public returns (uint256) {
        return 7;
    }
}
