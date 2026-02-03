// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayStoragePushEmptyLengthAddress {
    address[] addressArray;

    function setGetLength(uint256 len) public returns (uint256) {
        while (addressArray.length < len) addressArray.push();
        while (addressArray.length > len) addressArray.pop();
        return addressArray.length;
    }
}
