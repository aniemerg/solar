// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesConcatNested {
    function f(bytes memory a, bytes memory b, bytes memory c) public returns (bytes memory) {
        return bytes.concat(bytes.concat(a, b), c);
    }
}
