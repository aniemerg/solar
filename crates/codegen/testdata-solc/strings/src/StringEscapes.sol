// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringEscapes {
    function f() public pure returns (bytes32) {
        bytes32 escapeCharacters = "\t\n\r\'\"\\";
        return escapeCharacters;
    }
}
