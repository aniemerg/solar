// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayDynamicStaticShortDecode.sol";

contract CalldataArrayDynamicStaticShortDecodeTest is Test {
    CalldataArrayDynamicStaticShortDecode c;

    function setUp() public {
        c = new CalldataArrayDynamicStaticShortDecode();
    }

    function test_f_valid_common_encoding() public {
        // f(uint256[][2][]): 0x20, 0x01, 0x20, 0x40, 0x60, 0x00, 0x00 -> 23
        // x.length==1, x[0][0].length==0, x[0][1].length==0
        uint256[][2][] memory x = new uint256[][2][](1);
        x[0][0] = new uint256[](0);
        x[0][1] = new uint256[](0);
        uint256 result = c.f(x);
        assertEq(result, 23);
    }

    function test_f_invalid_too_short_reverts() public {
        // f(uint256[][2][]): 0x20, 0x01, 0x20, 0x00 -> FAILURE (too short)
        // Manually craft calldata that's too short
        bytes memory callData = abi.encodePacked(
            CalldataArrayDynamicStaticShortDecode.f.selector,
            uint256(0x20),   // offset to array
            uint256(0x01),   // array length = 1
            uint256(0x20),   // offset to x[0]
            uint256(0x00)    // only one word - missing second offset
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
