// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayStoragePushEmpty {
    uint256[] storageArray;

    function pushEmpty(uint256 len) public {
        while (storageArray.length < len) storageArray.push();
        for (uint256 i = 0; i < len; i++) require(storageArray[i] == 0);
    }
}
