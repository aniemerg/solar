// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionsCalledByConstructorThroughDispatch.sol";

contract FunctionsCalledByConstructorThroughDispatchTest {
    function test_FunctionsCalledByConstructorThroughDispatch() public {
        FunctionsCalledByConstructorThroughDispatch c = new FunctionsCalledByConstructorThroughDispatch();
        // "abcdef" left-shifted by 3 bytes = "def\x00\x00\x00"
        assert(c.getName() == bytes6(hex"646566000000"));
    }
}
