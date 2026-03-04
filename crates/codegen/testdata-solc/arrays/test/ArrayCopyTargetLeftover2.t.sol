// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyTargetLeftover2.sol";

contract ArrayCopyTargetLeftover2Test {
    function test_ArrayCopyTargetLeftover2() public {
        ArrayCopyTargetLeftover2 c = new ArrayCopyTargetLeftover2();
        // test() -> 0x04000000000000000000000000000000000000000000000000, 0x0, 0x0
        (bytes10 r1, bytes10 r2, bytes10 r3) = c.runTest();
        assert(r1 == bytes10(bytes8(uint64(4))));
        assert(r2 == bytes10(0));
        assert(r3 == bytes10(0));
    }
}
