// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataLengthRead {
    function lenBytesRead(bytes calldata x) public returns (uint l) {
        assembly { l := x.length }
    }

    function lenStringRead(string calldata x) public returns (uint l) {
        assembly { l := x.length }
    }
}
