// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/AbiDecodeV2.sol";

// Ported from: abiEncoderV1/abi_decode_v2.sol
// f() -> 0x20, 0x8, 0x40, 0x3, 0x9, 0xa, 0xb
contract AbiDecodeV2Test is Test {
    AbiDecodeV2 c;

    function setUp() public {
        c = new AbiDecodeV2();
    }

    function test_f() public {
        AbiDecodeV2.S memory result = c.f();
        assertEq(result.a, 8);
        assertEq(result.b.length, 3);
        assertEq(result.b[0], 9);
        assertEq(result.b[1], 10);
        assertEq(result.b[2], 11);
    }
}
