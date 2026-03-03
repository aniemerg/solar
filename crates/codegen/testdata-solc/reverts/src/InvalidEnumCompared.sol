// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvalidEnumCompared {
    enum X {A, B}

    function run_eq() public returns (bool) {
        X garbled;
        assembly {
            garbled := 5
        }
        return garbled == garbled;
    }

    function run_eq_ok() public returns (bool) {
        X garbled = X.A;
        return garbled == garbled;
    }

    function run_neq() public returns (bool) {
        X garbled;
        assembly {
            garbled := 5
        }
        return garbled != garbled;
    }
}
