// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyTargetLeftover.sol";

contract ArrayCopyTargetLeftoverTest {
    function test_ArrayCopyTargetLeftover() public {
        ArrayCopyTargetLeftover c = new ArrayCopyTargetLeftover();
        // test() -> 0xffffffff, 0x0000...0a000900..., 0x000...0
        (uint check, uint res1, uint res2) = c.runTest();
        assert(check == 0xffffffff);
        // res1: data2[0..9] = [1,2,3,4,5,6,7,8,9,10] as bytes2, data2[10..15] = 0
        // res1 = sum(uint16(data2[i]) * 0x10000^i) for i in 0..15
        // After copy: data2[0]=0x0100, data2[1]=0x0200, ..., data2[9]=0x0a00, data2[10..15]=0
        assert(res1 == 0x0000000000000000000000000a00090008000700060005000400030002000100);
        assert(res2 == 0);
    }
}
