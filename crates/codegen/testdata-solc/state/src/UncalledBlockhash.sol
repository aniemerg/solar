// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UncalledBlockhash {
    function f() public view returns (bytes32) {
        return (blockhash)(block.number - 1);
    }
}
