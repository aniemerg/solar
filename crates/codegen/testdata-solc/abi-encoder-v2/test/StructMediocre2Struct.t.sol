// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/StructMediacre2Struct.sol";

contract StructMediocre2StructTest is Test {
    StructMediocre2Struct c;

    function setUp() public {
        c = new StructMediocre2Struct();
    }

    function test_f() public {
        // f(uint256,(address,uint256[])[2],uint256): 7, ..., 8 -> 7, 0x0, 8
        StructMediocre2Struct.S[2] memory s;
        s[0].c = StructMediocre2Struct(address(0));
        s[0].x = new uint[](2);
        s[0].x[0] = 0x11; s[0].x[1] = 0x12;
        s[1].c = StructMediocre2Struct(address(0x99));
        s[1].x = new uint[](4);
        s[1].x[0] = 0x31; s[1].x[1] = 0x32; s[1].x[2] = 0x34; s[1].x[3] = 0x35;
        (uint r1, StructMediocre2Struct r2, uint r3) = c.f(7, s, 8);
        assertEq(r1, 7);
        assertEq(address(r2), address(0));
        assertEq(r3, 8);
    }
}
