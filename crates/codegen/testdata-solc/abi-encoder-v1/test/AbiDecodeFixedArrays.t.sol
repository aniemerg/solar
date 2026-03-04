// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/AbiDecodeFixedArrays.sol";

// Ported from: abiEncoderV1/abi_decode_fixed_arrays.sol
// f(uint16[3],uint16[2][3],uint256,uint256,uint256): 1, 2, 3, 11, 12, 21, 22, 31, 32, 1, 2, 1 -> 2, 32
contract AbiDecodeFixedArraysTest is Test {
    AbiDecodeFixedArrays c;

    function setUp() public {
        c = new AbiDecodeFixedArrays();
    }

    function test_f() public {
        uint16[3] memory a = [uint16(1), uint16(2), uint16(3)];
        uint16[2][3] memory b;
        b[0] = [uint16(11), uint16(12)];
        b[1] = [uint16(21), uint16(22)];
        b[2] = [uint16(31), uint16(32)];

        (uint r1, uint r2) = c.f(a, b, 1, 2, 1);
        assertEq(r1, 2);
        assertEq(r2, 32);
    }
}
