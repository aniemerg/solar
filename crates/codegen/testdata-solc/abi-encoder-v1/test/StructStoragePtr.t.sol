// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/StructStoragePtr.sol";

// Ported from: abiEncoderV1/struct/struct_storage_ptr.sol
// f() -> 8, 7, 1, 2, 7, 12
contract StructStoragePtrTest is Test {
    StructStoragePtr c;

    function setUp() public {
        c = new StructStoragePtr();
    }

    function test_f() public {
        (uint r2, uint sx, uint a, uint b, uint cv, uint d) = c.f();
        assertEq(r2, 8);   // r[2] was set to 8 by L.f
        assertEq(sx, 7);   // s.x was set to 7 by L.f
        assertEq(a, 1);    // r[0] = 1
        assertEq(b, 2);    // r[1] = 2
        assertEq(cv, 7);   // s.x = 7
        assertEq(d, 12);   // s.y = 12
    }
}
