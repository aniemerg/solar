// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
pragma abicoder v2;

import {Test} from "forge-std/Test.sol";
import "../src/ErrorsByParameterType.sol";

contract ErrorsByParameterTypeTest is Test {
    ErrorsByParameterType c;

    function setUp() public {
        c = new ErrorsByParameterType();
    }

    function test_ErrorsByParameterType() public {
        // a() -> FAILURE, hex"92bbf6e8"
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x92bbf6e8)));
        c.a();

        // b() -> FAILURE, hex"47e26897", 1
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x47e26897), uint256(1)));
        c.b();

        // c() -> FAILURE, hex"8f372c34", "string literal"
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x8f372c34), "string literal"));
        c.c();

        // d() -> FAILURE, hex"5717173e", S(1, true, "string literal")
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x5717173e), S(1, true, "string literal")));
        c.d();

        // e() -> FAILURE, hex"7efef9ea", 0x1234
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x7efef9ea), address(0x1234)));
        c.e();
    }
}
