// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract NamedParametersShadowingTypes {
    enum EnumType {A, B, C}

    struct StructType {
        uint x;
    }

    error E1(StructType StructType);
    error E2(EnumType StructType, StructType EnumType);

    function f() public {
        revert E1({StructType: StructType(42)});
    }

    function g() public {
        revert E2({EnumType: StructType(42), StructType: EnumType.B});
    }
}
