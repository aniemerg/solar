// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/AbiEncodeEmptyStringV2.sol";

contract AbiEncodeEmptyStringV2Test is Test {
    AbiEncodeEmptyStringV2 c;

    function setUp() public {
        c = new AbiEncodeEmptyStringV2();
    }

    function test_f() public {
        // f() -> 0x40, 0xa0, 0x40, 0x20, 0x0, 0x0
        // abi.encode("") encodes a string/bytes with offset(32) + length(0) = 64 bytes total
        // abi.encodePacked("") = empty bytes (0 bytes)
        (bytes memory encoded, bytes memory packed) = c.f();
        // abi.encode("") is 64 bytes: [offset=0x20, length=0]
        assertEq(encoded.length, 64);
        // First 32 bytes: the offset pointer (0x20)
        uint256 offset;
        assembly { offset := mload(add(encoded, 0x20)) }
        assertEq(offset, 0x20);
        // Second 32 bytes: the length (0)
        uint256 len;
        assembly { len := mload(add(encoded, 0x40)) }
        assertEq(len, 0);
        // abi.encodePacked("") is empty
        assertEq(packed.length, 0);
    }
}
