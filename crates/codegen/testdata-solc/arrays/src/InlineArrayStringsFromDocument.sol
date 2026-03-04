// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineArrayStringsFromDocument {
    function f(uint256 i) public pure returns (string memory) {
        string[4] memory x = ["This", "is", "an", "array"];
        return (x[i]);
    }
}
