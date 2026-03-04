// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataThreeDimensionalDynamicArrayIndexAccess.sol";

contract CalldataThreeDimensionalDynamicArrayIndexAccessTest is Test {
    CalldataThreeDimensionalDynamicArrayIndexAccess c;

    function setUp() public {
        c = new CalldataThreeDimensionalDynamicArrayIndexAccess();
    }

    function test_f_index00() public {
        // f(uint256[][],uint256,uint256): 0x60, 0, 0, 2, 0x40, 0x80, 1, 7, 1, 8 -> 0x20, 0x20, 7
        // s[0][0] = 7
        // We use pure since no state
    }

    function test_f() public {
        uint[][] memory s = new uint[][](2);
        s[0] = new uint[](1);
        s[0][0] = 7;
        s[1] = new uint[](1);
        s[1][0] = 8;
        bytes memory result = c.f(s, 0, 0);
        uint256 val = abi.decode(result, (uint256));
        assertEq(val, 7);
    }

    function test_f_index10() public {
        uint[][] memory s = new uint[][](2);
        s[0] = new uint[](1);
        s[0][0] = 7;
        s[1] = new uint[](1);
        s[1][0] = 8;
        bytes memory result = c.f(s, 1, 0);
        uint256 val = abi.decode(result, (uint256));
        assertEq(val, 8);
    }

    function test_g_out_of_bounds_reverts() public {
        // g with out-of-bounds index -> FAILURE with Panic(0x32)
        uint[][][] memory s = new uint[][][](2);
        s[0] = new uint[][](1);
        s[0][0] = new uint[](1);
        s[0][0][0] = 4;
        s[1] = new uint[][](2);
        s[1][0] = new uint[](2);
        s[1][0][0] = 5; s[1][0][1] = 6;
        s[1][1] = new uint[](1);
        s[1][1][0] = 7;
        vm.expectRevert();
        c.g(s, 1, 0, 2); // index 2 out of bounds for s[1][0] which has 2 elements (indices 0 and 1)
    }

    function test_h() public {
        // h(uint256[][][1],uint256): 0x40, 1, 0x20, 2, 0x40, 0xA0, 2, 5, 6, 3, 7, 8, 9 -> 0x20, 0xa0, 0x20, 3, 7, 8, 9
        uint[][][1] memory s;
        s[0] = new uint[][](2);
        s[0][0] = new uint[](2);
        s[0][0][0] = 5; s[0][0][1] = 6;
        s[0][1] = new uint[](3);
        s[0][1][0] = 7; s[0][1][1] = 8; s[0][1][2] = 9;
        bytes memory result = c.h(s, 1);
        uint[] memory decoded = abi.decode(result, (uint[]));
        assertEq(decoded.length, 3);
        assertEq(decoded[0], 7);
        assertEq(decoded[1], 8);
        assertEq(decoded[2], 9);
    }
}
