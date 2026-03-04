// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/AbiEncodeRational.sol";

// Ported from: abiEncoderV1/abi_encode_rational.sol
// f() -> 0x20, 0x40, 0x1, -2
// Encodes (int256(1), int256(-2))
contract AbiEncodeRationalTest is Test {
    AbiEncodeRational c;

    function setUp() public {
        c = new AbiEncodeRational();
    }

    function test_f() public {
        bytes memory result = c.f();
        assertEq(result.length, 64);
        (int256 a, int256 b) = abi.decode(result, (int256, int256));
        assertEq(a, 1);
        assertEq(b, -2);
    }
}
