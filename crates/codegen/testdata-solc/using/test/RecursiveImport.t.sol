// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/RecursiveImport.sol";

contract RecursiveImportTest {
    RecursiveImport c;

    function setUp() public {
        c = new RecursiveImport();
    }

    function test_f() public view {
        // f() -> 11 (cr()=T(0), .f()=T(1), .g()=11)
        assert(c.f() == 11);
    }
}
