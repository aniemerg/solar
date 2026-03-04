// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesConcat2Args {
    function f(bytes memory a, bytes memory b) public returns (bytes memory) {
        return bytes.concat(a, b);
    }
}
