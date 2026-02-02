// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayStorageIndexAccess {
    uint256[] storageArray;

    function testIndices(uint256 len) public {
        while (storageArray.length < len) storageArray.push();
        while (storageArray.length > len) storageArray.pop();
        for (uint256 i = 0; i < len; i++) storageArray[i] = i + 1;
        for (uint256 i = 0; i < len; i++) require(storageArray[i] == i + 1);
    }
}
