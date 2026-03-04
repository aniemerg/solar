// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesConcatDifferentTypes {
    bytes s = "bcdef";

    function f(bytes memory a) public returns (bytes memory) {
        return bytes.concat(a, "bcdef");
    }

    function g(bytes calldata a) public returns (bytes memory) {
        return bytes.concat(a, "abcdefghabcdefghabcdefghabcdefghab");
    }

    function h(bytes calldata a) public returns (bytes memory) {
        return bytes.concat(a, s);
    }

    function j(bytes calldata a) public returns (bytes memory) {
        bytes storage ref = s;
        return bytes.concat(a, ref, s);
    }

    function k(bytes calldata a, string memory b) public returns (bytes memory) {
        return bytes.concat(a, bytes(b));
    }

    function slice(bytes calldata a) public returns (bytes memory) {
        require(a.length > 2, "");
        return bytes.concat(a[:2], a[2:]);
    }

    function strParam(string calldata a) public returns (bytes memory) {
        return bytes.concat(bytes(a), "bcdef");
    }
}
