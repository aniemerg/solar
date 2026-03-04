// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayStructDynamic.sol";

contract CalldataArrayStructDynamicTest is Test {
    CalldataArrayStructDynamic c;

    function setUp() public {
        c = new CalldataArrayStructDynamic();
    }

    function test_f() public {
        // f((uint256[])[]): 32, 1, 32, 32, 3, 17, 42, 23 -> 32, 256, 32, 1, 32, 32, 3, 17, 42, 23
        CalldataArrayStructDynamic.S[] memory s = new CalldataArrayStructDynamic.S[](1);
        s[0].a = new uint256[](3);
        s[0].a[0] = 17; s[0].a[1] = 42; s[0].a[2] = 23;
        bytes memory result = c.f(s);
        CalldataArrayStructDynamic.S[] memory decoded = abi.decode(result, (CalldataArrayStructDynamic.S[]));
        assertEq(decoded[0].a.length, 3);
        assertEq(decoded[0].a[0], 17);
        assertEq(decoded[0].a[1], 42);
        assertEq(decoded[0].a[2], 23);
    }

    function test_g() public {
        CalldataArrayStructDynamic.S[] memory s = new CalldataArrayStructDynamic.S[](1);
        s[0].a = new uint256[](3);
        s[0].a[0] = 17; s[0].a[1] = 42; s[0].a[2] = 23;
        bytes memory result = c.g(s);
        CalldataArrayStructDynamic.S[] memory decoded = abi.decode(result, (CalldataArrayStructDynamic.S[]));
        assertEq(decoded[0].a[0], 17);
    }
}
