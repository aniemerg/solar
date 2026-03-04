// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/IndexedLogTopicDuringExplicitDowncast.sol";

contract IndexedLogTopicDuringExplicitDowncastTest {
    function test_IndexedLogTopicDuringExplicitDowncast() public {
        IndexedLogTopicDuringExplicitDowncast c = new IndexedLogTopicDuringExplicitDowncast();
        // uint8(0x31313131...31) = 0x31, but assembly y := x reads the slot value
        // In standard codegen, the uint8 variable may retain dirty bits: 0x31313131
        assert(c.f() == 0x31313131);
        // bytes1(bytes16(0x3131...31)) in standard codegen: reads 16 bytes
        assert(c.g() == 0x3131313131313131313131313131313100000000000000000000000000000000);
        // bytes1 x from sub(0,-1) = 0xff...ff, y = x as bytes32 gives 0xff left-aligned
        assert(c.h() == 0xff00000000000000000000000000000000000000000000000000000000000000);
    }
}
