// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DeleteStruct.sol";

contract DeleteStructTest {
    DeleteStruct c;

    function setUp() public {
        c = new DeleteStruct();
    }

    function test_DeleteStruct() public view {
        assert(c.getToDelete() == 0);
        assert(c.getTopValue() == 0);
        assert(c.getNestedValue() == 0);
        // Mapping values are NOT cleared by delete (mappings excluded from delete)
        assert(c.getTopMapping(0) == 1);
        assert(c.getTopMapping(1) == 2);
        assert(c.getNestedMapping(0) == true);
        assert(c.getNestedMapping(1) == false);
    }
}
