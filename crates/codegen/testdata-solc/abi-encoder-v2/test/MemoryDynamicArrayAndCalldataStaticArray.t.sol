// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/MemoryDynamicArrayAndCalldataStaticArray.sol";

contract MemoryDynamicArrayAndCalldataStaticArrayTest is Test {
    MemoryDynamicArrayAndCalldataStaticArray c;

    function setUp() public {
        c = new MemoryDynamicArrayAndCalldataStaticArray();
    }

    function test_f() public {
        // f(uint256[],uint256[1]): 0x40, 0xff, 1, 0xffff -> 0x20, 0x80, 0x40, 0xff, 1, 0xffff
        uint256[] memory a = new uint256[](1);
        a[0] = 0xff;
        uint256[1] memory b;
        b[0] = 0xffff;
        bytes memory result = c.f(a, b);
        (uint256[] memory decA, uint256[1] memory decB) = abi.decode(result, (uint256[], uint256[1]));
        assertEq(decA[0], 0xff);
        assertEq(decB[0], 0xffff);
    }

    function test_g() public {
        uint256[] memory a = new uint256[](1);
        a[0] = 0xff;
        uint256[1] memory b;
        b[0] = 0xffff;
        bytes memory result = c.g(a, b);
        (uint256[] memory decA, uint256[1] memory decB) = abi.decode(result, (uint256[], uint256[1]));
        assertEq(decA[0], 0xff);
        assertEq(decB[0], 0xffff);
    }

    function test_h() public {
        // h(uint256[],uint256[1]): 0x40, 0xff, 1, 0xffff -> 0x40, 0xff, 1, 0xffff
        uint256[] memory a = new uint256[](1);
        a[0] = 0xff;
        uint256[1] memory b;
        b[0] = 0xffff;
        (uint256[] memory retA, uint256[1] memory retB) = c.h(a, b);
        assertEq(retA[0], 0xff);
        assertEq(retB[0], 0xffff);
    }
}
