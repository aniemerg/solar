// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/AbiEncodeDecodeSimple.sol";

// Ported from: abiEncoderV1/abi_encode_decode_simple.sol
// f() -> 0x21, 0x40, 0x7, "abcdefg"
contract AbiEncodeDecodeSimpleTest is Test {
    AbiEncodeDecodeSimple c;

    function setUp() public {
        c = new AbiEncodeDecodeSimple();
    }

    function test_f() public {
        (uint256 n, bytes memory b) = c.f();
        assertEq(n, 33);
        assertEq(b.length, 7);
        assertEq(string(b), "abcdefg");
    }
}
