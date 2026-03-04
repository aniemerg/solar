// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StorageLayoutStruct.sol";

contract StorageLayoutStructTest {
    function test_storageSlots() public {
        StorageLayoutStruct c = new StorageLayoutStruct();
        (uint s, uint o) = c.storage_a();
        assert(s == 0 && o == 0);
        (s, o) = c.storage_ra();
        assert(s == 1 && o == 0);
        (s, o) = c.storage_b();
        assert(s == 2 && o == 0);
        (s, o) = c.storage_rb();
        assert(s == 3 && o == 0);
        (s, o) = c.storage_c();
        assert(s == 4 && o == 0);
        (s, o) = c.storage_rc();
        assert(s == 5 && o == 0);
        (s, o) = c.storage_d();
        assert(s == 6 && o == 0);
        (s, o) = c.storage_rd();
        assert(s == 7 && o == 0);
    }

    function test_set_a() public {
        StorageLayoutStruct c = new StorageLayoutStruct();
        c.set_a(MyInt64.wrap(100), MyInt64.wrap(200));
        // slot 0: 100 in bytes [0..7], 200 in bytes [8..15]
        assert(c.read_slot(0) == 0xc80000000000000064);
    }

    function test_set_ra() public {
        StorageLayoutStruct c = new StorageLayoutStruct();
        c.set_ra(100, 200);
        assert(c.read_slot(1) == 0xc80000000000000064);
    }

    function test_read_contents_asm() public {
        StorageLayoutStruct c = new StorageLayoutStruct();
        (bytes32 rxa, bytes32 rya, bytes32 rxb, bytes32 ryb) = c.read_contents_asm();
        assert(rxa == 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe);
        assert(rya == 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe);
        assert(rxb == 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd);
        assert(ryb == 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd);
    }
}
