// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DirtyUint8Read.sol";

contract DirtyUint8ReadTest {
    function test_dirtyUint8Read() public {
        DirtyUint8Read c = new DirtyUint8Read();
        assert(MyInt8.unwrap(c.x()) == -5);
        c.create_dirty_slot();
        // -5 = 0xfb...fb, clear MSB -> 0x7fff...fb
        // reading back as MyInt8, sign-extended in assembly: still 0xfb in low byte
        assert(c.read_unclean_value() == 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffb);
    }
}
