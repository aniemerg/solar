// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionMemoryArray {
    function a(uint256 x) public returns (uint256) {
        return x + 1;
    }

    function b(uint256 x) public returns (uint256) {
        return x + 2;
    }

    function c(uint256 x) public returns (uint256) {
        return x + 3;
    }

    function d(uint256 x) public returns (uint256) {
        return x + 5;
    }

    function e(uint256 x) public returns (uint256) {
        return x + 8;
    }

    function doTest(uint256 x, uint256 i) public returns (uint256) {
        function(uint) internal returns (uint)[] memory arr =
            new function(uint) internal returns (uint)[](10);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr[i](x);
    }
}
