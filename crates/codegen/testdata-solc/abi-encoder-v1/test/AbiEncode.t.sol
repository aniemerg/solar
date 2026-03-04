// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/AbiEncode.sol";

// Ported from: abiEncoderV1/abi_encode.sol
contract AbiEncodeTest is Test {
    AbiEncode c;

    function setUp() public {
        c = new AbiEncode();
    }

    function test_f0() public {
        // f0() -> 0x20, 0x0  => bytes of length 0
        bytes memory result = c.f0();
        assertEq(result.length, 0);
    }

    function test_f1() public {
        // f1() -> 0x20, 0x40, 0x1, 0x2  => 64 bytes encoding (1, 2)
        bytes memory result = c.f1();
        assertEq(result.length, 64);
        (uint256 a, uint256 b) = abi.decode(result, (uint256, uint256));
        assertEq(a, 1);
        assertEq(b, 2);
    }

    function test_f2() public {
        // f2() -> 0x20, 0xa0, 0x1, 0x60, 0x2, 0x3, "abc"
        // encodes (1, "abc", 2)
        bytes memory result = c.f2();
        (uint256 a, string memory x, uint256 b) = abi.decode(result, (uint256, string, uint256));
        assertEq(a, 1);
        assertEq(x, "abc");
        assertEq(b, 2);
    }

    function test_f3() public {
        // Same as f2 but also checks memory allocation
        bytes memory result = c.f3();
        (uint256 a, string memory x, uint256 b) = abi.decode(result, (uint256, string, uint256));
        assertEq(a, 1);
        assertEq(x, "abc");
        assertEq(b, 2);
    }

    function test_f4() public {
        // f4() -> 0x20, 0x20, "ab"
        // encodes bytes2("ab") padded to 32 bytes
        bytes memory result = c.f4();
        assertEq(result.length, 32);
        bytes32 val = abi.decode(result, (bytes32));
        // bytes2("ab") is "ab" left-padded to 32 bytes
        assertEq(val, bytes32(bytes2("ab")));
    }
}
