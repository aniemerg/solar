// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Tests that rational numbers (even negative ones) are encoded properly.
contract AbiEncodeRationalV2 {
    function f() public pure returns (bytes memory) {
        return abi.encode(1, -2);
    }
}
