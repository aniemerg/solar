// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayStorageLengthAccess {
    uint256[] storageArray;

    function setGetLength(uint256 len) public returns (uint256) {
        while (storageArray.length < len) storageArray.push();
        return storageArray.length;
    }
}
