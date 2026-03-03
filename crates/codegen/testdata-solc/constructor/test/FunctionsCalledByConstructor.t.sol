// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionsCalledByConstructor.sol";

contract FunctionsCalledByConstructorTest {
    function test_FunctionsCalledByConstructor() public {
        FunctionsCalledByConstructor c = new FunctionsCalledByConstructor();
        assert(c.getName() == "abc");
    }
}
