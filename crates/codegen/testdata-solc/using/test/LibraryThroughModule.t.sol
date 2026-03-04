// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryThroughModule.sol";

contract LibraryThroughModuleTest {
    LibraryThroughModule c;

    function setUp() public {
        c = new LibraryThroughModule();
    }

    function test_f_and_g() public view {
        assert(c.f(5) == 5);
        assert(c.f(10) == 10);
        assert(c.g(5) == 1);
        assert(c.g(10) == 1);
    }
}
