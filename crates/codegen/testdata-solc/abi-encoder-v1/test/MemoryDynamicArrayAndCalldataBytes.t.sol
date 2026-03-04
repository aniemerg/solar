// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/MemoryDynamicArrayAndCalldataBytes.sol";

// Ported from: abiEncoderV1/memory_dynamic_array_and_calldata_bytes.sol
// f(uint256[],bytes): 0x40, 0x80, 1, 0xFF, 6, "123456" -> 0x20, 0xc0, 0x40, 0x80, 1, 0xff, 6, "123456"
// g(uint256[],bytes): 0x40, 0x80, 1, 0xffff, 8, "12345678" -> 0x20, 0xc0, 0x40, 0x80, 1, 0xffff, 8, "12345678"
contract MemoryDynamicArrayAndCalldataBytesTest is Test {
    MemoryDynamicArrayAndCalldataBytes c;

    function setUp() public {
        c = new MemoryDynamicArrayAndCalldataBytes();
    }

    function test_f() public {
        uint256[] memory a = new uint256[](1);
        a[0] = 0xFF;
        bytes memory result = c.f(a, "123456");
        // Decode the result: abi.encode(a, b) => (uint256[], bytes)
        (uint256[] memory ra, bytes memory rb) = abi.decode(result, (uint256[], bytes));
        assertEq(ra.length, 1);
        assertEq(ra[0], 0xFF);
        assertEq(rb.length, 6);
        assertEq(string(rb), "123456");
    }

    function test_g() public {
        uint256[] memory a = new uint256[](1);
        a[0] = 0xffff;
        bytes memory result = c.g(a, "12345678");
        (uint256[] memory ra, bytes memory rb) = abi.decode(result, (uint256[], bytes));
        assertEq(ra.length, 1);
        assertEq(ra[0], 0xffff);
        assertEq(rb.length, 8);
        assertEq(string(rb), "12345678");
    }
}
