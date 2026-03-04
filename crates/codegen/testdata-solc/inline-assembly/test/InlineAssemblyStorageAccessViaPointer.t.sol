// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyStorageAccessViaPointer.sol";

contract InlineAssemblyStorageAccessViaPointerTest is Test {
    InlineAssemblyStorageAccessViaPointer c;

    function setUp() public {
        c = new InlineAssemblyStorageAccessViaPointer();
    }

    // f() -> true
    // a() -> 7
    // separator() -> 0
    // separator2() -> 0
    function test_all() public {
        assertEq(c.f(), true);
        assertEq(c.a(), 7);
        assertEq(c.separator(), 0);
        assertEq(c.separator2(), 0);
    }
}
