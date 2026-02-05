// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventDynamicArrayStorage {
    event E(uint256[]);
    uint256[] arr;

    function createEvent(uint256 x) public {
        while (arr.length < 3) arr.push();
        arr[0] = x;
        arr[1] = x + 1;
        arr[2] = x + 2;
        emit E(arr);
    }
}
