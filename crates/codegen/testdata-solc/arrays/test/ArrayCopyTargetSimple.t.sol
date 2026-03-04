// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyTargetSimple.sol";

contract ArrayCopyTargetSimpleTest {
    function test_ArrayCopyTargetSimple() public {
        ArrayCopyTargetSimple c = new ArrayCopyTargetSimple();
        // test() -> 0x01..., 0x02..., 0x03..., 0x04..., 0x0
        // data2[i] = bytes17(bytes8(i))
        (bytes17 a, bytes17 b, bytes17 cc, bytes17 d, bytes17 e) = c.runTest();
        assert(a == bytes17(bytes8(uint64(1))));
        assert(b == bytes17(bytes8(uint64(2))));
        assert(cc == bytes17(bytes8(uint64(3))));
        assert(d == bytes17(bytes8(uint64(4))));
        assert(e == bytes17(0));
    }
}
