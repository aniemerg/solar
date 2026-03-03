// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvalidEnumStored {
    enum X {A, B}
    X public x;

    function store_invalid() public returns (uint256) {
        X garbled = X.A;
        assembly {
            garbled := 5
        }
        x = garbled;
        return 1;
    }

    function store_ok() public returns (uint256) {
        x = X.A;
        return 1;
    }
}
