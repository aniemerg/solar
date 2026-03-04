// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayTwoDynamic.sol";

contract CalldataArrayTwoDynamicTest is Test {
    CalldataArrayTwoDynamic c;

    function setUp() public {
        c = new CalldataArrayTwoDynamic();
    }

    function test_f_which_true() public {
        // f(uint256[],uint256[],bool): 0x60, 0xE0, true, 3, 23, 42, 87, 2, 51, 72 -> 32, 160, 0x20, 3, 23, 42, 87
        uint256[] memory s1 = new uint256[](3);
        s1[0] = 23; s1[1] = 42; s1[2] = 87;
        uint256[] memory s2 = new uint256[](2);
        s2[0] = 51; s2[1] = 72;
        bytes memory result = c.f(s1, s2, true);
        uint256[] memory decoded = abi.decode(result, (uint256[]));
        assertEq(decoded.length, 3);
        assertEq(decoded[0], 23);
    }

    function test_f_which_false() public {
        // f(uint256[],uint256[],bool): 0x60, 0xE0, false, 3, 23, 42, 87, 2, 51, 72 -> 32, 128, 0x20, 2, 51, 72
        uint256[] memory s1 = new uint256[](3);
        s1[0] = 23; s1[1] = 42; s1[2] = 87;
        uint256[] memory s2 = new uint256[](2);
        s2[0] = 51; s2[1] = 72;
        bytes memory result = c.f(s1, s2, false);
        uint256[] memory decoded = abi.decode(result, (uint256[]));
        assertEq(decoded.length, 2);
        assertEq(decoded[0], 51);
        assertEq(decoded[1], 72);
    }

    function test_g_which_true() public {
        uint256[] memory s1 = new uint256[](3);
        s1[0] = 23; s1[1] = 42; s1[2] = 87;
        uint256[] memory s2 = new uint256[](2);
        s2[0] = 51; s2[1] = 72;
        bytes memory result = c.g(s1, s2, true);
        uint256[] memory decoded = abi.decode(result, (uint256[]));
        assertEq(decoded.length, 3);
        assertEq(decoded[2], 87);
    }
}
