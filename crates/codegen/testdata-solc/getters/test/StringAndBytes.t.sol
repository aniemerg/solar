// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StringAndBytes.sol";

contract StringAndBytesTest {
    StringAndBytes c;

    function setUp() public {
        c = new StringAndBytes();
    }

    function test_getters() public view {
        // a() -> "hello world" (11 bytes)
        assert(keccak256(bytes(c.a())) == keccak256(bytes("hello world")));

        // b() -> "ABCD" (hex 41424344)
        assert(keccak256(bytes(c.b())) == keccak256(bytes("ABCD")));

        // c() -> hex"ff077fff" (4 bytes)
        bytes memory cv = c.c();
        assert(cv.length == 4);
        assert(cv[0] == 0xff);
        assert(cv[1] == 0x07);
        assert(cv[2] == 0x7f);
        assert(cv[3] == 0xff);

        // d() -> "abcd"
        assert(keccak256(bytes(c.d())) == keccak256(bytes("abcd")));
    }
}
