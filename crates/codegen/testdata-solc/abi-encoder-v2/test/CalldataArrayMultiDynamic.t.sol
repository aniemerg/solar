// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayMultiDynamic.sol";

contract CalldataArrayMultiDynamicTest is Test {
    CalldataArrayMultiDynamic c;

    function setUp() public {
        c = new CalldataArrayMultiDynamic();
    }

    function test_f() public {
        // f(uint256[][]): 0x20, 2, 0x40, 0xC0, 3, 13, 17, 23, 4, 27, 31, 37, 41 -> 32, 416, 32, 2, 64, 192, 3, 13, 17, 23, 4, 27, 31, 37, 41
        uint256[][] memory s = new uint256[][](2);
        s[0] = new uint256[](3);
        s[0][0] = 13; s[0][1] = 17; s[0][2] = 23;
        s[1] = new uint256[](4);
        s[1][0] = 27; s[1][1] = 31; s[1][2] = 37; s[1][3] = 41;
        bytes memory result = c.f(s);
        uint256[][] memory decoded = abi.decode(result, (uint256[][]));
        assertEq(decoded[0][0], 13);
        assertEq(decoded[1][3], 41);
    }

    function test_g() public {
        uint256[][] memory s = new uint256[][](2);
        s[0] = new uint256[](3);
        s[0][0] = 13; s[0][1] = 17; s[0][2] = 23;
        s[1] = new uint256[](4);
        s[1][0] = 27; s[1][1] = 31; s[1][2] = 37; s[1][3] = 41;
        bytes memory result = c.g(s);
        uint256[][] memory decoded = abi.decode(result, (uint256[][]));
        assertEq(decoded[0][2], 23);
        assertEq(decoded[1][0], 27);
    }

    function test_j() public {
        // j(bytes[]): 0x20, 2, 0x40, 0x63, 3, hex"131723", 4, hex"27313741" -> 32, 256, 32, 2, 64, 128, 3, left(0x131723), 4, left(0x27313741)
        bytes[] memory s = new bytes[](2);
        s[0] = hex"131723";
        s[1] = hex"27313741";
        bytes memory result = c.j(s);
        bytes[] memory decoded = abi.decode(result, (bytes[]));
        assertEq(decoded[0].length, 3);
        assertEq(uint8(decoded[0][0]), 0x13);
        assertEq(decoded[1].length, 4);
        assertEq(uint8(decoded[1][0]), 0x27);
    }
}
