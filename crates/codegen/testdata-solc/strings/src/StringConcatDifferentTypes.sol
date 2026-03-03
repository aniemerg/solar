// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringConcatDifferentTypes {
    string s = "bcdef";

    function f(string memory a) public pure returns (string memory) {
        return string.concat(a, "bcdef");
    }

    function g(string calldata a) public pure returns (string memory) {
        return string.concat(a, "abcdefghabcdefghabcdefghabcdefghab");
    }

    function h(string calldata a) public view returns (string memory) {
        return string.concat(a, s);
    }

    function j(string calldata a) public view returns (string memory) {
        string storage ref = s;
        return string.concat(a, ref, s);
    }

    function k(string calldata a, bytes memory b) public pure returns (string memory) {
        return string.concat(a, string(b));
    }

    function slice(string calldata a) public pure returns (string memory) {
        require(bytes(a).length > 2, "");
        return string.concat(a[:2], a[2:]);
    }

    function strParam(bytes calldata a) public pure returns (string memory) {
        return string.concat(string(a), "bcdef");
    }
}
