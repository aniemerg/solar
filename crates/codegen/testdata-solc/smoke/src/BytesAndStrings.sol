// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesAndStrings {
    function e(bytes memory b) public pure returns (bytes memory) {
        return b;
    }

    function f() public pure returns (string memory, string memory) {
        return ("any", "any");
    }

    function g() public pure returns (string memory, uint, string memory) {
        return ("any", 42, "any");
    }

    function h() public pure returns (string memory) {
        return "any";
    }
}
