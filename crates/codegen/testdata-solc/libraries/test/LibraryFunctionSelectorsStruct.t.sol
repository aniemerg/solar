// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryFunctionSelectorsStruct.sol";

contract LibraryFunctionSelectorsStructTest {
    LibraryFunctionSelectorsStruct c;

    function setUp() public {
        c = new LibraryFunctionSelectorsStruct();
    }

    function test_f() public {
        // f() -> true, true, 42
        (bool selectorMatch, bool success, uint256 val) = c.f();
        assert(selectorMatch == true);
        assert(success == true);
        assert(val == 42);
    }

    function test_g() public {
        // g() -> true, true, 23
        (bool selectorMatch, bool success, uint256 val) = c.g();
        assert(selectorMatch == true);
        assert(success == true);
        assert(val == 23);
    }
}
