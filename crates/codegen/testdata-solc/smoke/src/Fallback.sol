// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fallback {
    uint public data;
    uint public balance;
    bytes public externalData;

    fallback() external payable {
        data += 1;
        balance = msg.value;
        externalData = msg.data;
    }
}
