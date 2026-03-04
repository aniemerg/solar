// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/FreeDifferentIntegerTypesS2.sol";
contract FreeDifferentIntegerTypesTest is Test {
    function test_FreeDifferentIntegerTypes() public {
        C c = new C();
        (uint a, bool b) = c.foo();
        assertEq(a, 24);
        assertEq(b, true);
    }
}
