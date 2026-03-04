// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayDynamicIndexAccess.sol";

contract CalldataArrayDynamicIndexAccessTest is Test {
    CalldataArrayDynamicIndexAccess c;

    function setUp() public {
        c = new CalldataArrayDynamicIndexAccess();
    }

    function test_f() public {
        // f(uint256[]): 32, 3, 42, 23, 87 -> 32, 160, 32, 3, 42, 23, 87
        uint256[] memory s = new uint256[](3);
        s[0] = 42; s[1] = 23; s[2] = 87;
        bytes memory result = c.f(s);
        uint256[] memory decoded = abi.decode(result, (uint256[]));
        assertEq(decoded[0], 42);
        assertEq(decoded[1], 23);
        assertEq(decoded[2], 87);
    }

    function test_g_index0() public {
        // g(uint256[][2],uint256): 0x40, 0, 0x40, 0xC0, 3, 42, 23, 87, 4, 11, 13, 17 -> 32, 160, 32, 3, 42, 23, 87
        uint256[][2] memory s;
        s[0] = new uint256[](3);
        s[0][0] = 42; s[0][1] = 23; s[0][2] = 87;
        s[1] = new uint256[](3);
        s[1][0] = 11; s[1][1] = 13; s[1][2] = 17;
        bytes memory result = c.g(s, 0);
        uint256[] memory decoded = abi.decode(result, (uint256[]));
        assertEq(decoded[0], 42);
        assertEq(decoded[1], 23);
        assertEq(decoded[2], 87);
    }

    function test_g_index1() public {
        // g(uint256[][2],uint256): 0x40, 1, 0x40, 0xC0, 3, 42, 23, 87, 4, 11, 13, 17, 27 -> 32, 192, 32, 4, 11, 13, 17, 27
        uint256[][2] memory s;
        s[0] = new uint256[](3);
        s[0][0] = 42; s[0][1] = 23; s[0][2] = 87;
        s[1] = new uint256[](4);
        s[1][0] = 11; s[1][1] = 13; s[1][2] = 17; s[1][3] = 27;
        bytes memory result = c.g(s, 1);
        uint256[] memory decoded = abi.decode(result, (uint256[]));
        assertEq(decoded.length, 4);
        assertEq(decoded[0], 11);
        assertEq(decoded[1], 13);
        assertEq(decoded[2], 17);
        assertEq(decoded[3], 27);
    }

    function test_k_index0() public {
        // k(bytes[2],uint256): 0x40, 0, 0x40, 0x63, 3, hex"AB11FF", 4, hex"FF791432" -> 32, 96, 32, 3, left(0xAB11FF)
        bytes[2] memory s;
        s[0] = hex"AB11FF";
        s[1] = hex"FF791432";
        bytes memory result = c.k(s, 0);
        bytes memory decoded = abi.decode(result, (bytes));
        assertEq(decoded.length, 3);
        assertEq(uint8(decoded[0]), 0xAB);
        assertEq(uint8(decoded[1]), 0x11);
        assertEq(uint8(decoded[2]), 0xFF);
    }

    function test_k_index1() public {
        // k(bytes[2],uint256): 0x40, 1, 0x40, 0x63, 3, hex"AB11FF", 4, hex"FF791432" -> 32, 96, 32, 4, left(0xFF791432)
        bytes[2] memory s;
        s[0] = hex"AB11FF";
        s[1] = hex"FF791432";
        bytes memory result = c.k(s, 1);
        bytes memory decoded = abi.decode(result, (bytes));
        assertEq(decoded.length, 4);
        assertEq(uint8(decoded[0]), 0xFF);
        assertEq(uint8(decoded[1]), 0x79);
        assertEq(uint8(decoded[2]), 0x14);
        assertEq(uint8(decoded[3]), 0x32);
    }
}
