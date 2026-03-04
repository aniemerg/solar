// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DerivedOverloadBaseFunctionIndirect.sol";

contract DerivedOverloadBaseFunctionIndirectTest {
    C c;

    function setUp() public {
        c = new C();
    }

    function test_DerivedOverloadBaseFunctionIndirect() public {
        assert(c.g() == 10);
        assert(c.h() == 2);
    }
}
