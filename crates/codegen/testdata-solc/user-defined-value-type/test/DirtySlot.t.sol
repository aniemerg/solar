// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DirtySlot.sol";
import {Test} from "forge-std/Test.sol";

contract DirtySlotTest is Test {
    DirtySlot c;

    function setUp() public {
        c = new DirtySlot();
    }

    function test_initialValues() public {
        assert(MyUInt16.unwrap(c.a()) == 13);
        // b = bytes2(uint16(1025)) = bytes2(0x0401), left-aligned = 0x0401000...
        assert(MyBytes2.unwrap(c.b()) == bytes2(uint16(1025)));
        assert(c.get_b(0) == bytes1(0x04));
        assert(c.get_b(1) == bytes1(0x01));
    }

    function test_get_b_outOfBounds() public {
        vm.expectRevert();
        c.get_b(2);
    }

    function test_write_a() public {
        c.write_a();
        // dirty slot: only lowest 2 bytes read = 0x2001
        assert(MyUInt16.unwrap(c.a()) == 0x2001);
    }

    function test_write_b() public {
        c.write_b();
        // dirty slot value = 0xf00e...32001, b reads top 2 bytes of slot = 0x5403
        // 0x5403 as bytes2 left-aligned = 0x5403000...
        assert(MyBytes2.unwrap(c.b()) == bytes2(0x5403));
    }
}
