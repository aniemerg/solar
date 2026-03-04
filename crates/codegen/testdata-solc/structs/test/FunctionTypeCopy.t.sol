// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionTypeCopy.sol";

contract FunctionTypeCopyTest {
    FunctionTypeCopy c;

    function setUp() public {
        c = new FunctionTypeCopy();
    }

    function test_FunctionTypeCopy() public {
        assert(c.run() == true);
    }
}
