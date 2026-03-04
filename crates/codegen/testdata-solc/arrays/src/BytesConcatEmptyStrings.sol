// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesConcatEmptyStrings {
    function f() public returns (bytes memory) {
        bytes memory b = "";
        return bytes.concat(
            bytes.concat(b),
            bytes.concat(b, b),
            bytes.concat("", b),
            bytes.concat(b, "")
        );
    }

    function g() public returns (bytes memory) {
        return bytes.concat("", "abc", hex"", "abc", unicode"");
    }

    function h() public returns (bytes memory) {
        bytes memory b = "";
        return bytes.concat(b, "abc", b, "abc", b);
    }
}
