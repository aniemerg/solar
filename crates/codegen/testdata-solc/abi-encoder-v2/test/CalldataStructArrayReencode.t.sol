// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataStructArrayReencode.sol";

contract CalldataStructArrayReencodeTest is Test {
    CalldataStructArrayReencode c;

    function setUp() public {
        c = new CalldataStructArrayReencode();
    }

    function test_f_empty_x() public {
        // f((uint256[])): 0x20, 0x20, 0 -> 0x20, 0x60, 0x20, 0x20, 0
        CalldataStructArrayReencode.D memory a;
        a.x = new uint[](0);
        bytes memory result = c.f(a);
        CalldataStructArrayReencode.D memory decoded = abi.decode(result, (CalldataStructArrayReencode.D));
        assertEq(decoded.x.length, 0);
    }

    function test_f_invalid_reverts() public {
        // f((uint256[])): 0x20, 0x20, 1 -> FAILURE (length 1 but no element)
        bytes memory callData = abi.encodePacked(
            CalldataStructArrayReencode.f.selector,
            uint256(0x20),   // struct offset
            uint256(0x20),   // field offset within struct
            uint256(1)       // x.length = 1 but no element
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_j_valid() public {
        // j((uint256)[]): 0x20, 2, 1, 2 -> 0x20, 0x80, 0x20, 2, 1, 2
        CalldataStructArrayReencode.S[] memory a = new CalldataStructArrayReencode.S[](2);
        a[0] = CalldataStructArrayReencode.S(1);
        a[1] = CalldataStructArrayReencode.S(2);
        bytes memory result = c.j(a);
        CalldataStructArrayReencode.S[] memory decoded = abi.decode(result, (CalldataStructArrayReencode.S[]));
        assertEq(decoded.length, 2);
        assertEq(decoded[0].x, 1);
        assertEq(decoded[1].x, 2);
    }

    function test_k_valid() public {
        // k((uint256)[2]): 1, 2 -> 0x20, 0x40, 1, 2
        CalldataStructArrayReencode.S[2] memory a;
        a[0] = CalldataStructArrayReencode.S(1);
        a[1] = CalldataStructArrayReencode.S(2);
        bytes memory result = c.k(a);
        CalldataStructArrayReencode.S[2] memory decoded = abi.decode(result, (CalldataStructArrayReencode.S[2]));
        assertEq(decoded[0].x, 1);
        assertEq(decoded[1].x, 2);
    }
}
