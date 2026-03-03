// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library L {
    function x() internal returns (uint256) {
        return 7;
    }
}

contract StoreInternalUnusedLibraryFunctionInConstructor {
    function() returns (uint256) internal x;

    constructor() {
        x = L.x;
    }

    function t() public returns (uint256) {
        return x();
    }
}
