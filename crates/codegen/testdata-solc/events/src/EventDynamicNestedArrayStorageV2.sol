// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventDynamicNestedArrayStorageV2 {
    event E(uint[][]);
    uint[][] arr;
    function createEvent(uint x) public {
        arr.push(new uint[](2));
        arr.push(new uint[](2));
        arr[0][0] = x;
        arr[0][1] = x + 1;
        arr[1][0] = x + 2;
        arr[1][1] = x + 3;
        emit E(arr);
    }
}
