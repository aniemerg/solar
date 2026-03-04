// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AsmAddressConstantRegression.sol";

contract AsmAddressConstantRegressionTest {
    function test_AsmAddressConstantRegression() public {
        AsmAddressConstantRegression c = new AsmAddressConstantRegression();
        // address constant loaded via assembly: bytes1 z takes the low byte of the padded address
        // The address 0x1212121212121212121212121000002134593163 in bytes1 is 0x00
        // (assembly z := e loads the full 32-byte word; bytes1 takes only the highest byte,
        // which in a left-aligned bytes1 would be 0x00 since the value is right-aligned)
        assert(c.f() == bytes1(0x00));
    }
}
