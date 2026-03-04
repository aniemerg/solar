// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Mcopy.sol";

contract McopyTest is Test {
    Mcopy c;

    function setUp() public {
        c = new Mcopy();
    }

    // f(bytes): 0x20, 0x20, 0xffeeddccbbaa9988776655443322110000112233445566778899aabbccddeeff
    // -> 0x20, 0x20, 0x0000000000000000776655443322110000112233445566770000000000000000
    function test_f() public {
        bytes memory src = hex"ffeeddccbbaa9988776655443322110000112233445566778899aabbccddeeff";
        bytes memory dst = c.f(src);
        assertEq(dst.length, 32);
        bytes memory expected = hex"0000000000000000776655443322110000112233445566770000000000000000";
        assertEq(dst, expected);
    }
}
