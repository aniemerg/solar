// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataDynamicArrayToMemory.sol";

contract CalldataDynamicArrayToMemoryTest is Test {
    CalldataDynamicArrayToMemory c;

    function setUp() public {
        c = new CalldataDynamicArrayToMemory();
    }

    function test_f_valid() public {
        // f(uint256[][]): 0x20, 2, 0x40, 0xa0, 2, 5, 6, 2, 7, 8 -> 0x20, 2, 0x40, 0xa0, 2, 5, 6, 2, 7, 8
        uint[][] memory a = new uint[][](2);
        a[0] = new uint[](2);
        a[0][0] = 5; a[0][1] = 6;
        a[1] = new uint[](2);
        a[1][0] = 7; a[1][1] = 8;
        uint[][] memory result = c.f(a);
        assertEq(result.length, 2);
        assertEq(result[0][0], 5);
        assertEq(result[1][1], 8);
    }

    function test_f_extra_data_ignored() public {
        // f(uint256[][]): 0x20, 2, 0x40, 0xa0, 2, 5, 6, 2, 7, 8, 9 -> 0x20, 2, 0x40, 0xa0, 2, 5, 6, 2, 7, 8
        // Extra trailing data is ignored
        uint[][] memory a = new uint[][](2);
        a[0] = new uint[](2);
        a[0][0] = 5; a[0][1] = 6;
        a[1] = new uint[](2);
        a[1][0] = 7; a[1][1] = 8;
        uint[][] memory result = c.f(a);
        assertEq(result[0][0], 5);
        assertEq(result[1][0], 7);
    }

    function test_f_too_short_reverts() public {
        // f(uint256[][]): 0x20, 2, 0x40, 0xa0, 2, 5, 6, 3, 7, 8 -> FAILURE
        // Array claims length 3 but only 2 elements present
        bytes memory callData = abi.encodePacked(
            CalldataDynamicArrayToMemory.f.selector,
            uint256(0x20),   // outer offset
            uint256(2),      // outer length
            uint256(0x40),   // offset to a[0]
            uint256(0xa0),   // offset to a[1]
            uint256(2),      // a[0].length
            uint256(5),
            uint256(6),
            uint256(3),      // a[1].length = 3, but only 2 elements
            uint256(7),
            uint256(8)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_h_valid() public {
        // h(uint256[2][][]): 0x20, 2, 0x40, 0x60, 0, 2, 5, 6, 7, 8 -> same
        uint[2][][] memory a = new uint[2][][](2);
        a[0] = new uint[2][](0);
        a[1] = new uint[2][](2);
        a[1][0] = [uint(5), 6];
        a[1][1] = [uint(7), 8];
        uint[2][][] memory result = c.h(a);
        assertEq(result[0].length, 0);
        assertEq(result[1][0][0], 5);
        assertEq(result[1][1][1], 8);
    }
}
