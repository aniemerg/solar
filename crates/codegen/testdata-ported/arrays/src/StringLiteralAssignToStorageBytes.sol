// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringLiteralAssignToStorageBytes {
    bytes public s = "abc";
    bytes public s1 = "abcd";

    function f() public {
        s = "abcd";
        s1 = "abc";
    }

    function g() public {
        (s, s1) = ("abc", "abcd");
    }
}
