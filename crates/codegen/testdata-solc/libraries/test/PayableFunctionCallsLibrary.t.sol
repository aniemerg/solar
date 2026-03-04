// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PayableFunctionCallsLibrary.sol";

contract PayableFunctionCallsLibraryTest {
    PayableFunctionCallsLibrary c;

    function setUp() public {
        c = new PayableFunctionCallsLibrary();
    }

    function test_f() public {
        // f(): 27 -> 7 (payable call with 27 wei, returns 7)
        assert(c.f{value: 27}() == 7);
    }

    receive() external payable {}
    fallback() external payable {}
}
