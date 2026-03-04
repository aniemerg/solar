// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Strings.sol";

contract StringsTest {
    Strings c;

    function setUp() public {
        c = new Strings();
    }

    function test_fixedBytesHex() public view {
        // hex"aabb00ff" left-padded in bytes32
        bytes32 result = c.fixedBytesHex();
        assert(result[0] == 0xaa);
        assert(result[1] == 0xbb);
        assert(result[2] == 0x00);
        assert(result[3] == 0xff);
    }

    function test_fixedBytes() public view {
        // "abc\x00\xff__" as bytes32
        bytes32 result = c.fixedBytes();
        assert(result[0] == 0x61); // 'a'
        assert(result[1] == 0x62); // 'b'
        assert(result[2] == 0x63); // 'c'
        assert(result[3] == 0x00);
        assert(result[4] == 0xff);
        assert(result[5] == 0x5f); // '_'
        assert(result[6] == 0x5f); // '_'
    }

    function test_pipeThrough() public view {
        // pipeThrough(bytes2,bool): "\x00\x02", true -> "\x00\x02", true
        (bytes16 large, bool oneRet) = c.pipeThrough(bytes2(0x0002), true);
        assert(large[0] == 0x00);
        assert(large[1] == 0x02);
        assert(oneRet == true);
    }
}
