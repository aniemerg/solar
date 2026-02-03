// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringToBytes {
    function f(string memory s) public pure returns (bytes memory t) {
        t = bytes(s);
    }
}
