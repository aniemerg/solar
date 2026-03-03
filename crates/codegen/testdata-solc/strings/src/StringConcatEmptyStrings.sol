// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringConcatEmptyStrings {
    function f() public pure returns (string memory) {
        string memory b = "";
        return string.concat(
            string.concat(b),
            string.concat(b, b),
            string.concat("", b),
            string.concat(b, "")
        );
    }

    function g() public pure returns (string memory) {
        return string.concat("", "abc", hex"", "abc", unicode"");
    }

    function h() public pure returns (string memory) {
        string memory b = "";
        return string.concat(b, "abc", b, "abc", b);
    }
}
