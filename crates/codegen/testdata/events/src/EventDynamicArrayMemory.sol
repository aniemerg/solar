// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventDynamicArrayMemory {
    event E(uint256[]);

    function createEvent(uint256 x) public {
        uint256[] memory arr = new uint256[](3);
        arr[0] = x;
        arr[1] = x + 1;
        arr[2] = x + 2;
        emit E(arr);
    }
}
