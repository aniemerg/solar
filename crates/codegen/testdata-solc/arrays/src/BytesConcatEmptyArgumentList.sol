// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesConcatEmptyArgumentList {
    function f() public returns (bytes memory) {
        return bytes.concat();
    }
}
