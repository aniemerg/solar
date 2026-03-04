// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/AbiDecodeStaticArray.sol";

// Ported from: abiEncoderV1/abi_decode_static_array.sol
// f(bytes): 0x20, 0xc0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6 -> 1, 2, 3, 4, 5, 6
contract AbiDecodeStaticArrayTest is Test {
    AbiDecodeStaticArray c;

    function setUp() public {
        c = new AbiDecodeStaticArray();
    }

    function test_f() public {
        // Encode uint256[2][3]: [[1,2],[3,4],[5,6]]
        uint256[2][3] memory arr;
        arr[0] = [uint256(1), uint256(2)];
        arr[1] = [uint256(3), uint256(4)];
        arr[2] = [uint256(5), uint256(6)];
        bytes memory encoded = abi.encode(arr);

        uint256[2][3] memory result = c.f(encoded);
        assertEq(result[0][0], 1);
        assertEq(result[0][1], 2);
        assertEq(result[1][0], 3);
        assertEq(result[1][1], 4);
        assertEq(result[2][0], 5);
        assertEq(result[2][1], 6);
    }
}
