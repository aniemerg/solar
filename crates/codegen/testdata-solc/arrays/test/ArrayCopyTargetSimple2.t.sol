// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyTargetSimple2.sol";

contract ArrayCopyTargetSimple2Test {
    function test_ArrayCopyTargetSimple2() public {
        ArrayCopyTargetSimple2 c = new ArrayCopyTargetSimple2();
        // test() -> 0x01..., 0x02..., 0x03..., 0x04..., 0x00
        (bytes32 a, bytes32 b, bytes32 cc, bytes32 d, bytes32 e) = c.runTest();
        assert(a == bytes32(bytes8(uint64(1))));
        assert(b == bytes32(bytes8(uint64(2))));
        assert(cc == bytes32(bytes8(uint64(3))));
        assert(d == bytes32(bytes8(uint64(4))));
        assert(e == bytes32(0));
    }
}
