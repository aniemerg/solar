// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayStoragePushPop {
    uint256[] storageArray;

    function setGetLength(uint256 len) public returns (uint256) {
        while (storageArray.length < len) storageArray.push();
        while (storageArray.length > 0) storageArray.pop();
        return storageArray.length;
    }
}
