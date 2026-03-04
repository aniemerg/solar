// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructSimple {
    struct S { uint a; uint8 b; uint8 c; bytes2 d; }
    function f(S memory s) public pure returns (uint a, uint b, uint c, uint d) {
        a = s.a;
        b = s.b;
        c = s.c;
        d = uint16(s.d);
    }
}
