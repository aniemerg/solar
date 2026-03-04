// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AttachingAndDefiningOperatorWithSameFunction.sol";

contract AttachingAndDefiningOperatorWithSameFunctionTest {
    function test_AttachingAndDefiningOperatorWithSameFunction() public {
        C c = new C();
        assert(Int.unwrap(c.f()) == 10);
        assert(Int.unwrap(c.g()) == 13);
    }
}
