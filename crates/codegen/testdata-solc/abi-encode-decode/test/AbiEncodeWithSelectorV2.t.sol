// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiEncodeWithSelectorV2.sol";

contract AbiEncodeWithSelectorV2Test {
    AbiEncodeWithSelectorV2 c;

    function setUp() public {
        c = new AbiEncodeWithSelectorV2();
    }

    function test_AbiEncodeWithSelectorV2_f0() public view {
        bytes memory r = c.f0();
        // Just selector: 4 bytes
        assert(r.length == 4);
        assert(bytes4(r[0]) == 0x12000000);
        assert(r[0] == 0x12);
        assert(r[1] == 0x34);
        assert(r[2] == 0x56);
        assert(r[3] == 0x78);
    }

    function test_AbiEncodeWithSelectorV2_f1_f2_Consistent() public view {
        // f1 and f2 should encode identically
        assert(keccak256(c.f1()) == keccak256(c.f2()));
    }

    function test_AbiEncodeWithSelectorV2_f1() public view {
        bytes memory r = c.f1();
        // selector(4) + offset(32) + length(32) + data_padded(32) = 4 + 96 = 100 bytes
        assert(r.length == 100);
        // Selector prefix
        assert(r[0] == 0x12 && r[1] == 0x34 && r[2] == 0x56 && r[3] == 0x78);
    }

    function test_AbiEncodeWithSelectorV2_f3() public view {
        bytes memory r = c.f3();
        // selector(4) + uint256(32) = 36 bytes
        assert(r.length == 36);
        // Last 32 bytes is type(uint).max = 0xff...ff
        for (uint i = 4; i < 36; i++) {
            assert(r[i] == 0xff);
        }
    }

    function test_AbiEncodeWithSelectorV2_f4() public view {
        bytes memory r = c.f4();
        // selector(4) + encoded data
        assert(r.length > 4);
        assert(r[0] == 0x12 && r[1] == 0x34 && r[2] == 0x56 && r[3] == 0x78);
    }
}
