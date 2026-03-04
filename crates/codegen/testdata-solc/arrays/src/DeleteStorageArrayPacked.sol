// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeleteStorageArrayPacked {
    uint120[] data;

    function f() public returns (uint120, uint120, uint120) {
        data.push(123);
        data.push(234);
        data.push(345);
        delete data;
        assembly {
            sstore(data.slot, 3)
        }
        return (data[0], data[1], data[2]);
    }
}
