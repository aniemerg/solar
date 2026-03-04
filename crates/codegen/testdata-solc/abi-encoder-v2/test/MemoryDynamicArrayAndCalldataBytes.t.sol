// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/MemoryDynamicArrayAndCalldataBytes.sol";

contract MemoryDynamicArrayAndCalldataBytesTest is Test {
    MemoryDynamicArrayAndCalldataBytes c;

    function setUp() public {
        c = new MemoryDynamicArrayAndCalldataBytes();
    }

    function test_f() public {
        // f(uint256[],bytes): 0x40, 0x80, 1, 0xFF, 6, "123456" -> 0x20, 0xc0, 0x40, 0x80, 1, 0xff, 6, "123456"
        uint256[] memory a = new uint256[](1);
        a[0] = 0xFF;
        bytes memory b = "123456";
        bytes memory result = c.f(a, b);
        (uint256[] memory decA, bytes memory decB) = abi.decode(result, (uint256[], bytes));
        assertEq(decA.length, 1);
        assertEq(decA[0], 0xFF);
        assertEq(decB.length, 6);
        assertEq(decB[0], "1");
    }

    function test_g() public {
        // g(uint256[],bytes): 0x40, 0x80, 1, 0xffff, 8, "12345678" -> 0x20, 0xc0, 0x40, 0x80, 1, 0xffff, 8, "12345678"
        uint256[] memory a = new uint256[](1);
        a[0] = 0xffff;
        bytes memory b = "12345678";
        bytes memory result = c.g(a, b);
        (uint256[] memory decA, bytes memory decB) = abi.decode(result, (uint256[], bytes));
        assertEq(decA[0], 0xffff);
        assertEq(decB.length, 8);
    }
}
