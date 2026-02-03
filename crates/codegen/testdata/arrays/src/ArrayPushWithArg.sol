// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayPushWithArg {
    uint256[] storageArray;

    function test(uint256 v) public {
        storageArray.push(v);
    }

    function getLength() public view returns (uint256) {
        return storageArray.length;
    }

    function fetch(uint256 a) public view returns (uint256) {
        return storageArray[a];
    }
}
