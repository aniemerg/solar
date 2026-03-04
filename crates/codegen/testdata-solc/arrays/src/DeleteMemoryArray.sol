// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeleteMemoryArray {
    function len() public returns (uint ret) {
        uint[] memory data = new uint[](2);
        data[0] = 234;
        data[1] = 123;
        delete data;
        assembly {
            ret := mload(data)
        }
    }
}
