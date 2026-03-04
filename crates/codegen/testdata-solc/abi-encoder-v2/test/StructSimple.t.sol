// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/StructSimple.sol";

contract StructSimpleTest is Test {
    StructSimple c;

    function setUp() public {
        c = new StructSimple();
    }

    function test_f() public {
        // f((uint256,uint8,uint8,bytes2)): 1, 2, 3, "ab" -> 1, 2, 3, 0x6162
        StructSimple.S memory s;
        s.a = 1;
        s.b = 2;
        s.c = 3;
        s.d = bytes2("ab");
        // pure function, just test the encoding
        assertEq(s.a, 1);
        assertEq(s.b, 2);
        assertEq(s.c, 3);
        assertEq(uint16(s.d), 0x6162);
    }

    function test_f_full() public {
        StructSimple.S memory s;
        s.a = 1;
        s.b = 2;
        s.c = 3;
        s.d = bytes2("ab");
        (uint a, uint b, uint cc, uint d) = c.f(s);
        assertEq(a, 1);
        assertEq(b, 2);
        assertEq(cc, 3);
        assertEq(d, 0x6162);
    }
}
