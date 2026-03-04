// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/AbiDecodeTrivial.sol";

// Ported from: abiEncoderV1/abi_decode_trivial.sol
// f(bytes): 0x20, 0x20, 0x21 -> 33
contract AbiDecodeTrivialTest is Test {
    AbiDecodeTrivial c;

    function setUp() public {
        c = new AbiDecodeTrivial();
    }

    function test_f() public {
        bytes memory encoded = abi.encode(uint256(0x21));
        uint256 result = c.f(encoded);
        assertEq(result, 33);
    }
}
