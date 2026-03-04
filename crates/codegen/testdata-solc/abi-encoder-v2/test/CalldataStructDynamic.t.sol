// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataStructDynamic.sol";

contract CalldataStructDynamicTest is Test {
    CalldataStructDynamic c;

    function setUp() public {
        c = new CalldataStructDynamic();
    }

    function test_f() public {
        // f((uint256[])): 0x20, 0x20, 3, 42, 23, 17 -> 32, 192, 0x20, 0x20, 3, 42, 23, 17
        CalldataStructDynamic.S memory s;
        s.a = new uint256[](3);
        s.a[0] = 42; s.a[1] = 23; s.a[2] = 17;
        bytes memory result = c.f(s);
        CalldataStructDynamic.S memory decoded = abi.decode(result, (CalldataStructDynamic.S));
        assertEq(decoded.a.length, 3);
        assertEq(decoded.a[0], 42);
        assertEq(decoded.a[1], 23);
        assertEq(decoded.a[2], 17);
    }

    function test_g() public {
        CalldataStructDynamic.S memory s;
        s.a = new uint256[](3);
        s.a[0] = 42; s.a[1] = 23; s.a[2] = 17;
        bytes memory result = c.g(s);
        CalldataStructDynamic.S memory decoded = abi.decode(result, (CalldataStructDynamic.S));
        assertEq(decoded.a[0], 42);
    }
}
