// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/ArrayToMapping.sol";

contract ArrayToMappingTest {
    function test_ArrayToMapping() public {
        ArrayToMapping c = new ArrayToMapping();

        // from_storage() -> 0x20, 2, 0x40, 0xa0, 2, 10, 11, 3, 12, 13, 14
        uint8[][] memory r1 = c.from_storage();
        assert(r1.length == 2);
        assert(r1[0].length == 2);
        assert(r1[0][0] == 10);
        assert(r1[0][1] == 11);
        assert(r1[1].length == 3);
        assert(r1[1][0] == 12);
        assert(r1[1][1] == 13);
        assert(r1[1][2] == 14);

        // from_storage_ptr() -> same
        uint8[][] memory r2 = c.from_storage_ptr();
        assert(r2.length == 2);
        assert(r2[0][0] == 10);
        assert(r2[1][2] == 14);

        // from_memory() -> same
        uint8[][] memory r3 = c.from_memory();
        assert(r3.length == 2);
        assert(r3[0][0] == 10);
        assert(r3[1][2] == 14);
    }
}
