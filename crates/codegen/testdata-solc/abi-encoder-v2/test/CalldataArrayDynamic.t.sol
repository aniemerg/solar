// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayDynamic.sol";

contract CalldataArrayDynamicTest is Test {
    CalldataArrayDynamic c;

    function setUp() public {
        c = new CalldataArrayDynamic();
    }

    function test_f() public {
        // f(uint256[]): 32, 3, 23, 42, 87 -> 32, 160, 32, 3, 23, 42, 87
        uint256[] memory s = new uint256[](3);
        s[0] = 23; s[1] = 42; s[2] = 87;
        bytes memory result = c.f(s);
        uint256[] memory decoded = abi.decode(result, (uint256[]));
        assertEq(decoded.length, 3);
        assertEq(decoded[0], 23);
        assertEq(decoded[1], 42);
        assertEq(decoded[2], 87);
    }

    function test_g() public {
        // g(uint256[]): 32, 3, 23, 42, 87 -> 32, 160, 32, 3, 23, 42, 87
        uint256[] memory s = new uint256[](3);
        s[0] = 23; s[1] = 42; s[2] = 87;
        bytes memory result = c.g(s);
        uint256[] memory decoded = abi.decode(result, (uint256[]));
        assertEq(decoded.length, 3);
        assertEq(decoded[0], 23);
        assertEq(decoded[1], 42);
        assertEq(decoded[2], 87);
    }

    function test_h_valid() public {
        // h(uint8[]): 32, 3, 23, 42, 87 -> 32, 160, 32, 3, 23, 42, 87
        uint8[] memory s = new uint8[](3);
        s[0] = 23; s[1] = 42; s[2] = 87;
        bytes memory result = c.h(s);
        uint8[] memory decoded = abi.decode(result, (uint8[]));
        assertEq(decoded.length, 3);
        assertEq(decoded[0], 23);
        assertEq(decoded[1], 42);
        assertEq(decoded[2], 87);
    }

    function test_h_invalid_reverts() public {
        // h(uint8[]): 32, 3, 0xFF23, 0x1242, 0xAB87 -> FAILURE
        // Values > 0xFF are invalid for uint8 with v2 encoder
        bytes memory callData = abi.encodePacked(
            CalldataArrayDynamic.h.selector,
            uint256(0x20), uint256(3), uint256(0xFF23), uint256(0x1242), uint256(0xAB87)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_i_invalid_reverts() public {
        // i(uint8[]): 32, 3, 0xAB23, 0x1242, 0xFF87 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CalldataArrayDynamic.i.selector,
            uint256(0x20), uint256(3), uint256(0xAB23), uint256(0x1242), uint256(0xFF87)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_j() public {
        // j(bytes): 32, 3, hex"123456" -> 32, 96, 32, 3, left(0x123456)
        bytes memory s = hex"123456";
        bytes memory result = c.j(s);
        bytes memory decoded = abi.decode(result, (bytes));
        assertEq(decoded.length, 3);
        assertEq(uint8(decoded[0]), 0x12);
        assertEq(uint8(decoded[1]), 0x34);
        assertEq(uint8(decoded[2]), 0x56);
    }

    function test_k() public {
        // k(bytes): 32, 3, hex"AB33FF" -> 32, 96, 32, 3, left(0xAB33FF)
        bytes memory s = hex"AB33FF";
        bytes memory result = c.k(s);
        bytes memory decoded = abi.decode(result, (bytes));
        assertEq(decoded.length, 3);
        assertEq(uint8(decoded[0]), 0xAB);
        assertEq(uint8(decoded[1]), 0x33);
        assertEq(uint8(decoded[2]), 0xFF);
    }
}
