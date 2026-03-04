// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ExternalIdentifierAccessShadowing.sol";

contract ExternalIdentifierAccessShadowingTest is Test {
    ExternalIdentifierAccessShadowing c;

    function setUp() public {
        c = new ExternalIdentifierAccessShadowing();
    }

    // f() -> 2
    function test_f() public {
        assertEq(c.f(), 2);
    }
}
