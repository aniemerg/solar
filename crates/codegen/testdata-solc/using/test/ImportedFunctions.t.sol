// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ImportedFunctions.sol";

contract ImportedFunctionsTest {
    ImportedFunctions c;

    function setUp() public {
        c = new ImportedFunctions();
    }

    function test_f() public view {
        // f(uint256): 5 -> 12 (5+1 + 5+1 = 12)
        assert(c.f(5) == 12);
        // f(uint256): 10 -> 22 (10+1 + 10+1 = 22)
        assert(c.f(10) == 22);
    }
}
