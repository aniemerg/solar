// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransientStorageCreation {
    constructor() {
        uint x;
        assembly {
            tstore(0, 42)
            x := tload(0)
        }
        assert(x == 42);
    }
}
