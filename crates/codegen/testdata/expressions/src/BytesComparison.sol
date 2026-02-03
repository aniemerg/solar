// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesComparison {
    function f() public pure returns (bool) {
        bytes2 a = "a";
        bytes2 x = "aa";
        bytes2 b = "b";
        return a < x && x < b;
    }
}
