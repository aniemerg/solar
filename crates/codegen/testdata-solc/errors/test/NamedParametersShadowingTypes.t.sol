// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import {Test} from "forge-std/Test.sol";
import "../src/NamedParametersShadowingTypes.sol";

contract NamedParametersShadowingTypesTest is Test {
    NamedParametersShadowingTypes c;

    function setUp() public {
        c = new NamedParametersShadowingTypes();
    }

    function test_NamedParametersShadowingTypes() public {
        // f() -> FAILURE, hex"33a54193", 42
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x33a54193), uint256(42)));
        c.f();

        // g() -> FAILURE, hex"374b9387", 1, 42
        // E2(EnumType StructType, StructType EnumType)
        // EnumType.B = 1, StructType(42).x = 42
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x374b9387), uint256(1), uint256(42)));
        c.g();
    }
}
