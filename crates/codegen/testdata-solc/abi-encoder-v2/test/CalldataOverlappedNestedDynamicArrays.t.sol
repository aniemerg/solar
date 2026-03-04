// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataOverlappedNestedDynamicArrays.sol";

contract CalldataOverlappedNestedDynamicArraysTest is Test {
    CalldataOverlappedNestedDynamicArrays c;

    function setUp() public {
        c = new CalldataOverlappedNestedDynamicArrays();
    }

    function test_f_memory_normal() public {
        // Normal encoding test
        uint[][] memory a = new uint[][](2);
        a[0] = new uint[](2);
        a[0][0] = 1; a[0][1] = 2;
        a[1] = new uint[](2);
        a[1][0] = 1; a[1][1] = 2;
        uint[][] memory result = c.f_memory(a);
        assertEq(result.length, 2);
        assertEq(result[0][0], 1);
    }

    function test_f_memory_too_short_reverts() public {
        // f_memory(uint256[][]): 0x20, 2, 0, 0x60, 2, 2, 2 -> FAILURE
        // a[0] has length 0 but a[1] claims length 2 with only 2 words total at offset 0x60
        // but it points to itself (offset 0 means a[0] is empty, offset 0x60 is where a[1]'s
        // length word is, and a[1].length = 2 but only 1 element present)
        bytes memory callData = abi.encodePacked(
            CalldataOverlappedNestedDynamicArrays.f_memory.selector,
            uint256(0x20),
            uint256(2),
            uint256(0),
            uint256(0x60),
            uint256(2),
            uint256(2),
            uint256(2)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f_encode_normal() public {
        uint[][] memory a = new uint[][](2);
        a[0] = new uint[](2);
        a[0][0] = 1; a[0][1] = 2;
        a[1] = new uint[](1);
        a[1][0] = 2;
        bytes memory result = c.f_encode(a);
        uint[][] memory decoded = abi.decode(result, (uint[][]));
        assertEq(decoded[0][0], 1);
        assertEq(decoded[1][0], 2);
    }
}
