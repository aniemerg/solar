// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Test for regression of https://github.com/argotorg/solidity/issues/8406
contract AsmAddressConstantRegression {
    address constant e = 0x1212121212121212121212121000002134593163;

    function f() public pure returns (bytes1 z) {
        assembly { z := e }
    }
}
