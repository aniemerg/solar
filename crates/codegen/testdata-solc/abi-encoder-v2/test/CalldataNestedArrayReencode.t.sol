// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataNestedArrayReencode.sol";

contract CalldataNestedArrayReencodeTest is Test {
    CalldataNestedArrayReencode c;

    function setUp() public {
        c = new CalldataNestedArrayReencode();
    }

    function test_f_empty_inner() public {
        // f(uint256[][]): 0x20, 1, 0x20, 0 -> 0x20, 0x80, 0x20, 1, 0x20, 0
        uint[][] memory a = new uint[][](1);
        a[0] = new uint[](0);
        bytes memory result = c.f(a);
        uint[][] memory decoded = abi.decode(result, (uint[][]));
        assertEq(decoded.length, 1);
        assertEq(decoded[0].length, 0);
    }

    function test_f_invalid_inner_length_1_reverts() public {
        // f(uint256[][]): 0x20, 1, 0x20, 1 -> FAILURE (length 1 but no element)
        bytes memory callData = abi.encodePacked(
            CalldataNestedArrayReencode.f.selector,
            uint256(0x20),
            uint256(1),
            uint256(0x20),
            uint256(1)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_j_valid() public {
        // j(uint16[2][][]): 0x20, 2, 0x40, 0xa0, 1, 0x0a, 11, 2, 12, 13, 14, 15 -> ...
        uint16[2][][] memory a = new uint16[2][][](2);
        a[0] = new uint16[2][](1);
        a[0][0] = [uint16(10), 11];
        a[1] = new uint16[2][](2);
        a[1][0] = [uint16(12), 13];
        a[1][1] = [uint16(14), 15];
        bytes memory result = c.j(a);
        assertTrue(result.length > 0);
    }
}
