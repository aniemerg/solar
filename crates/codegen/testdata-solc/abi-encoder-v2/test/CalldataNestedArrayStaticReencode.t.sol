// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataNestedArrayStaticReencode.sol";

contract CalldataNestedArrayStaticReencodeTest is Test {
    CalldataNestedArrayStaticReencode c;

    function setUp() public {
        c = new CalldataNestedArrayStaticReencode();
    }

    function test_f_uint3_valid() public {
        // f(uint256[3][]): 0x20, 1, 0x01, 0x02, 0x03 ->
        uint[3][] memory a = new uint[3][](1);
        a[0] = [uint(1), 2, 3];
        c.f(a);
    }

    function test_f_uint3_too_short_reverts() public {
        // f(uint256[3][]): 0x20, 1, 0x01 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CalldataNestedArrayStaticReencode.f.selector,
            uint256(0x20),
            uint256(1),
            uint256(1)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_fSquare_valid() public {
        // f(uint256[2][2]): 0x01, 0x02, 0x03, 0x04 ->
        uint[2][2] memory a;
        a[0] = [uint(1), 2];
        a[1] = [uint(3), 4];
        c.fSquare(a);
    }

    function test_fSquare_too_short_reverts() public {
        // f(uint256[2][2]): 0x01, 0x02, 0x03 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CalldataNestedArrayStaticReencode.fSquare.selector,
            uint256(1), uint256(2), uint256(3)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
