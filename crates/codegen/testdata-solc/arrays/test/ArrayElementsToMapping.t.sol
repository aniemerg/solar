// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/ArrayElementsToMapping.sol";

contract ArrayElementsMappingTest {
    function test_ArrayElementsToMapping() public {
        ArrayElementsToMapping c = new ArrayElementsToMapping();

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

        // from_calldata(uint8[][]): 0x20, 2, 0x40, 0xa0, 2, 10, 11, 3, 12, 13, 14
        uint8[][] memory input = new uint8[][](2);
        input[0] = new uint8[](2);
        input[0][0] = 10;
        input[0][1] = 11;
        input[1] = new uint8[](3);
        input[1][0] = 12;
        input[1][1] = 13;
        input[1][2] = 14;
        uint8[][] memory r4 = c.from_calldata(input);
        assert(r4.length == 2);
        assert(r4[0][0] == 10);
        assert(r4[1][2] == 14);
    }
}
