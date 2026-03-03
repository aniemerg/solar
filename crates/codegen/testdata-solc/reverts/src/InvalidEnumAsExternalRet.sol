// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvalidEnumAsExternalRet {
    enum X {A, B}

    function run_return() public returns (X) {
        X garbled;
        assembly {
            garbled := 5
        }
        return garbled;
    }

    function run_inline_assignment() public returns (X _ret) {
        assembly {
            _ret := 5
        }
    }

    function run_assignment() public returns (X _ret) {
        X tmp;
        assembly {
            tmp := 5
        }
        _ret = tmp;
    }
}
