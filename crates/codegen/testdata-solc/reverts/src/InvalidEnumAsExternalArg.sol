// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvalidEnumAsExternalArg {
    enum X {A, B}

    function check(X x) public returns (uint256) {
        return 1;
    }

    function run() public returns (uint256) {
        X garbled;

        assembly {
            garbled := 5
        }

        return this.check(garbled);
    }
}
