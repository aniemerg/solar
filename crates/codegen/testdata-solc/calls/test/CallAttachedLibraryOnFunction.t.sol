// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CallAttachedLibraryOnFunction.sol";

contract CallAttachedLibraryOnFunctionTest {
    CallAttachedLibraryOnFunction c;

    function setUp() public {
        c = new CallAttachedLibraryOnFunction();
    }

    function test_f_returns_7() public {
        assert(c.f() == 7);
    }
}
