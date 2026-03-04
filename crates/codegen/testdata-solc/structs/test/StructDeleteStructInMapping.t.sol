// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructDeleteStructInMapping.sol";

contract StructDeleteStructInMappingTest {
    StructDeleteStructInMapping c;

    function setUp() public {
        c = new StructDeleteStructInMapping();
    }

    function test_StructDeleteStructInMapping() public {
        assert(c.deleteIt() == 0);
    }
}
