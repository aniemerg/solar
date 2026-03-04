// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/AbiDecodeDynamicArray.sol";

// Ported from: abiEncoderV1/abi_decode_dynamic_array.sol
// f(bytes): 0x20, 0xc0, 0x20, 0x4, 0x3, 0x4, 0x5, 0x6 -> 0x20, 0x4, 0x3, 0x4, 0x5, 0x6
contract AbiDecodeDynamicArrayTest is Test {
    AbiDecodeDynamicArray c;

    function setUp() public {
        c = new AbiDecodeDynamicArray();
    }

    function test_f() public {
        // Encode a uint256[] with 4 elements: [3, 4, 5, 6]
        // The bytes argument represents: offset=0x20, data starts at 0xc0 from start
        // Actually: the bytes data encodes a uint256[] = [3, 4, 5, 6]
        // abi.encode(uint256[]) = offset(0x20) + length(4) + elements
        uint256[] memory arr = new uint256[](4);
        arr[0] = 3;
        arr[1] = 4;
        arr[2] = 5;
        arr[3] = 6;
        bytes memory encoded = abi.encode(arr);

        uint256[] memory result = c.f(encoded);
        assertEq(result.length, 4);
        assertEq(result[0], 3);
        assertEq(result[1], 4);
        assertEq(result[2], 5);
        assertEq(result[3], 6);
    }
}
