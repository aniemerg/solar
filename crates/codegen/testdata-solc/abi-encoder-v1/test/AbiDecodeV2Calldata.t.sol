// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/AbiDecodeV2Calldata.sol";

// Ported from: abiEncoderV1/abi_decode_v2_calldata.sol
// f(bytes): 0x20, 0xe0, 0x20, 0x21, 0x40, 0x3, 0xa, 0xb, 0xc -> 0x20, 0x21, 0x40, 0x3, 0xa, 0xb, 0xc
contract AbiDecodeV2CalldataTest is Test {
    AbiDecodeV2Calldata c;

    function setUp() public {
        c = new AbiDecodeV2Calldata();
    }

    function test_f() public {
        AbiDecodeV2Calldata.S memory s;
        s.a = 0x21;
        s.b = new uint256[](3);
        s.b[0] = 0xa;
        s.b[1] = 0xb;
        s.b[2] = 0xc;
        bytes memory encoded = abi.encode(s);

        AbiDecodeV2Calldata.S memory result = c.f(encoded);
        assertEq(result.a, 0x21);
        assertEq(result.b.length, 3);
        assertEq(result.b[0], 0xa);
        assertEq(result.b[1], 0xb);
        assertEq(result.b[2], 0xc);
    }
}
