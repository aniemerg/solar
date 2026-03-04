// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataTooShort {
    function d(bytes memory _data) public pure returns (uint8) {
        return abi.decode(_data, (uint8));
    }
}
