// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingOfFunctions.sol";

contract MappingOfFunctionsTest {
    function test_stages() public {
        MappingOfFunctions c = new MappingOfFunctions();
        assert(c.success() == false);
        assert(c.f() == 7); // stage0 -> sets stage1
        assert(c.f() == 7); // stage1 -> sets stage2
        assert(c.success() == false);
        assert(c.f() == 7); // stage2 -> sets success = true
        assert(c.success() == true);
    }
}
