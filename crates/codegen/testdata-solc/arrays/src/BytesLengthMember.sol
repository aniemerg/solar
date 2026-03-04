// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesLengthMember {
    bytes data;

    function setData() public returns (bool) {
        data = msg.data;
        return true;
    }

    function getLength() public returns (uint256) {
        return data.length;
    }
}
