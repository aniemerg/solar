// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyInModifiers.sol";

contract InlineAssemblyInModifiersTest is Test {
    InlineAssemblyInModifiers c;

    function setUp() public {
        c = new InlineAssemblyInModifiers();
    }

    // f() -> true
    function test_f() public {
        assertEq(c.f(), true);
    }

    // g() -> FAILURE
    function test_g() public {
        vm.expectRevert();
        c.g();
    }
}
