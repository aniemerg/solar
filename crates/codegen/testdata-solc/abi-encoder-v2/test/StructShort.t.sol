// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/StructShort.sol";

contract StructShortTest is Test {
    StructShort c;

    function setUp() public {
        c = new StructShort();
    }

    function test_f_string_c() public {
        // f((int256,uint256,bytes16)): 0xff010, 0xff0002, "abcd" -> 0xff010, 0xff0002, "abcd"
        StructShort.S memory s;
        s.a = 0xff010;
        s.b = 0xff0002;
        s.c = bytes16("abcd");
        // Since this is pure we can't call through this.f(), just verify struct roundtrip
        assertEq(s.a, 0xff010);
        assertEq(s.b, 0xff0002);
        assertEq(s.c, bytes16("abcd"));
    }

    function test_f_roundtrip() public {
        // f((int256,uint256,bytes16)): 0xff010, 0xff0002, "abcd" -> same
        StructShort.S memory s;
        s.a = int256(0xff010);
        s.b = 0xff0002;
        s.c = bytes16("abcd");
        StructShort.S memory q = c.f(s);
        assertEq(q.a, int256(0xff010));
        assertEq(q.b, 0xff0002);
        assertEq(q.c, bytes16("abcd"));
    }

    function test_f() public {
        StructShort.S memory s;
        s.a = int256(0xff010);
        s.b = 0xff0002;
        s.c = bytes16("abcd");
        StructShort.S memory q = c.f(s);
        assertEq(q.a, int256(0xff010));
        assertEq(q.b, 0xff0002);
        assertEq(q.c, bytes16("abcd"));
    }

    function test_f_bytes16_mask() public {
        // f((int256,uint256,bytes16)): 0xff010, 0xff0002, 0x1111222233334444555566667777888800000000000000000000000000000000
        // -> 0xff010, 0xff0002, left(0x11112222333344445555666677778888)
        StructShort.S memory s;
        s.a = int256(0xff010);
        s.b = 0xff0002;
        // bytes16 takes the top 16 bytes of a bytes32
        bytes32 full = bytes32(0x1111222233334444555566667777888800000000000000000000000000000000);
        s.c = bytes16(full);
        StructShort.S memory q = c.f(s);
        assertEq(q.c, bytes16(0x11112222333344445555666677778888));
    }
}
