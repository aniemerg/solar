// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringConcatEmptyArgumentList {
    function f() public pure returns (string memory) {
        return string.concat();
    }
}
