// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyDifferentPacking.sol";

contract ArrayCopyDifferentPackingTest {
    function test_ArrayCopyDifferentPacking() public {
        ArrayCopyDifferentPacking c = new ArrayCopyDifferentPacking();
        // test() -> 0x01..., 0x02..., 0x03..., 0x04..., 0x05...
        // data2[i] = bytes10(bytes8(i)) -- left-padded in bytes10
        (bytes10 a, bytes10 b, bytes10 cc, bytes10 d, bytes10 e) = c.runTest();
        assert(a == bytes10(bytes8(uint64(1))));
        assert(b == bytes10(bytes8(uint64(2))));
        assert(cc == bytes10(bytes8(uint64(3))));
        assert(d == bytes10(bytes8(uint64(4))));
        assert(e == bytes10(bytes8(uint64(5))));
    }
}
