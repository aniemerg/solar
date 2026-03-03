// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CopyFromCalldataRemovesBytesData {
    bytes data;

    function set() public returns (bool) {
        data = msg.data;
        return true;
    }

    function checkIfDataIsEmpty() public view returns (bool) {
        return data.length == 0;
    }

    function sendMessage() public returns (bool, bytes memory) {
        bytes memory emptyData;
        return address(this).call(emptyData);
    }

    fallback() external {
        data = msg.data;
    }
}
