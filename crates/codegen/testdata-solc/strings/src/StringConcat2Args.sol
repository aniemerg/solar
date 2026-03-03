// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringConcat2Args {
    function f(string memory a, string memory b) public pure returns (string memory) {
        return string.concat(a, b);
    }
}
