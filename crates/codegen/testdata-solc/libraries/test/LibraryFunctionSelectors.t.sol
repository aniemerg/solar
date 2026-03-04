// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryFunctionSelectors.sol";

contract LibraryFunctionSelectorsTest {
    LibraryFunctionSelectors c;

    function setUp() public {
        c = new LibraryFunctionSelectors();
    }

    function test_f() public {
        // f() -> true, true, 7
        (bool selectorMatch, bool success, uint256 val) = c.f();
        assert(selectorMatch == true);
        assert(success == true);
        assert(val == 7);
    }

    function test_g() public {
        // g() -> true, true, 42
        (bool selectorMatch, bool success, uint256 val) = c.g();
        assert(selectorMatch == true);
        assert(success == true);
        assert(val == 42);
    }

    function test_h() public {
        // h() -> true, true, 23
        (bool selectorMatch, bool success, uint256 val) = c.h();
        assert(selectorMatch == true);
        assert(success == true);
        assert(val == 23);
    }
}
