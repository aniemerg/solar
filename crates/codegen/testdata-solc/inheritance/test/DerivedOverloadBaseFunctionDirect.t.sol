// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DerivedOverloadBaseFunctionDirect.sol";

contract DerivedOverloadBaseFunctionDirectTest {
    C c;

    function setUp() public {
        c = new C();
    }

    function test_DerivedOverloadBaseFunctionDirect() public {
        assert(c.g() == 2);
    }
}
