// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/CalldataArrayToMapping.sol";

contract CalldataArrayToMappingTest {
    function test_CalldataArrayToMapping() public {
        CalldataArrayToMapping c = new CalldataArrayToMapping();
        // from_calldata(uint8[][]): 0x20, 2, 0x40, 0xa0, 2, 10, 11, 3, 12, 13, 14 -> same
        uint8[][] memory inp = new uint8[][](2);
        inp[0] = new uint8[](2);
        inp[0][0] = 10; inp[0][1] = 11;
        inp[1] = new uint8[](3);
        inp[1][0] = 12; inp[1][1] = 13; inp[1][2] = 14;
        uint8[][] memory result = c.from_calldata(inp);
        assert(result.length == 2);
        assert(result[0][0] == 10);
        assert(result[0][1] == 11);
        assert(result[1][0] == 12);
        assert(result[1][1] == 13);
        assert(result[1][2] == 14);
    }
}
