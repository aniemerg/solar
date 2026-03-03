// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnicodeString {
    function f() public pure returns (string memory) {
        return unicode"😃, 😭, and 😈";
    }

    function g() public pure returns (string memory) {
        return unicode"😃, 😭, and 😈";
    }
}
