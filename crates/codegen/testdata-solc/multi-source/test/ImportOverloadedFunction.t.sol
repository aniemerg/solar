// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ImportOverloadedFunctionB.sol";
contract ImportOverloadedFunctionTest is Test {
    function test_ImportOverloadedFunction() public {
        C c = new C();
        (uint a, uint b) = c.f();
        assertEq(a, 1);
        assertEq(b, 2);
    }
}
