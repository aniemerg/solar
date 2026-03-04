// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/AbiEncodeV2.sol";

contract AbiEncodeV2Test is Test {
    AbiEncodeV2 c;

    function setUp() public {
        c = new AbiEncodeV2();
    }

    function test_f0() public {
        bytes memory result = c.f0();
        // f0() -> 0x20, 0x0
        // abi.encode() returns a bytes with length 0
        assertEq(result.length, 0);
    }

    function test_f1() public {
        bytes memory result = c.f1();
        // f1() -> 0x20, 0x40, 0x1, 0x2
        assertEq(result.length, 64);
        (uint256 a, uint256 b) = abi.decode(result, (uint256, uint256));
        assertEq(a, 1);
        assertEq(b, 2);
    }

    function test_f2() public {
        bytes memory result = c.f2();
        // f2() -> 0x20, 0xa0, 0x1, 0x60, 0x2, 0x3, "abc"
        (uint256 a, string memory x, uint256 b) = abi.decode(result, (uint256, string, uint256));
        assertEq(a, 1);
        assertEq(x, "abc");
        assertEq(b, 2);
    }

    function test_f3() public {
        bytes memory result = c.f3();
        (uint256 a, string memory x, uint256 b) = abi.decode(result, (uint256, string, uint256));
        assertEq(a, 1);
        assertEq(x, "abc");
        assertEq(b, 2);
    }

    function test_f4() public {
        bytes memory result = c.f4();
        // f4() -> 0x20, 0x160, 0x1, 0x80, 0xc0, 0x2, 0x3, "abc", 0x7, 0x40, 0x2, 0x2, 0x3
        // Verify first uint is 1
        uint256 first;
        assembly { first := mload(add(result, 0x20)) }
        assertEq(first, 1);
    }
}
