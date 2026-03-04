// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CleanupAbicoderV1.sol";

// In ABIcoder v1, dirty high bits in uint8 are NOT checked on input,
// so f(uint8): 0x1ff passes and returns 0xff (truncated).
// mem() returns [0x01ff, 0xff] before cleaning (because v1 doesn't clean mem slots).
contract CleanupAbicoderV1Test {
    function test_ret() public {
        CleanupAbicoderV1 c = new CleanupAbicoderV1();
        // ABI encoder cleans: 0x1ff -> 0xff on return
        assert(MyUInt8.unwrap(c.ret()) == 0xff);
    }

    function test_f_accepts_dirty() public {
        CleanupAbicoderV1 c = new CleanupAbicoderV1();
        // v1: 0x1ff is passed, uint8 portion is 0xff
        assert(MyUInt8.unwrap(c.f(MyUInt8.wrap(0xff))) == 0xff);
    }

    function test_stor() public {
        CleanupAbicoderV1 c = new CleanupAbicoderV1();
        (uint8 _a, MyUInt8 _b, uint8 _cc) = c.stor();
        assert(_a == 1);
        assert(MyUInt8.unwrap(_b) == 0xff);
        assert(_cc == 2);
    }
}
