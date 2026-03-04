// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ConstantAccessReferencing.sol";

contract ConstantAccessReferencingTest is Test {
    ConstantAccessReferencing c;

    function setUp() public {
        c = new ConstantAccessReferencing();
    }

    // f() -> 2, left(0xabcd), left(0x616263), true, 0x1212121212121212121212121212121212121212
    function test_f() public {
        (uint w, bytes2 x, bytes3 y, bool z, address t) = c.f();
        assertEq(w, 2);
        assertEq(x, bytes2(0xabcd));
        assertEq(y, bytes3(0x616263));
        assertEq(z, true);
        assertEq(t, address(0x1212121212121212121212121212121212121212));
    }
}
