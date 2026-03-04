// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AbiEncodeRational {
    function f() public pure returns (bytes memory) {
        return abi.encode(1, -2);
    }
}
