// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/FixedArraysAsReturnType.sol";

contract FixedArraysAsReturnTypeTest is Test {
    function test_FixedArraysAsReturnType() public {
        FixedArraysAsReturnType c = new FixedArraysAsReturnType();
        (uint16[5] memory res, uint16[5] memory res2) = c.f();
        assertEq(res[0], 2);
        assertEq(res[1], 3);
        assertEq(res[2], 4);
        assertEq(res[3], 5);
        assertEq(res[4], 6);
        assertEq(res2[0], 1000);
        assertEq(res2[1], 1001);
        assertEq(res2[2], 1002);
        assertEq(res2[3], 1003);
        assertEq(res2[4], 1004);
    }
}
