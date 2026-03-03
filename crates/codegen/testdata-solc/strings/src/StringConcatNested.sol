// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringConcatNested {
    function f(string memory a, string memory b, string memory c) public pure returns (string memory) {
        return string.concat(string.concat(a, b), c);
    }
}
