// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct CopyFromStorageS {
    uint x;
}

contract CopyFromStorage {
    CopyFromStorageS sStorage;

    constructor() {
        sStorage.x = 13;
    }

    function f() external returns (CopyFromStorageS[] memory) {
        CopyFromStorageS[] memory sMemory = new CopyFromStorageS[](1);
        sMemory[0] = sStorage;
        return sMemory;
    }
}
