// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MultipleOperatorSameTypeSameFunctionSameDirective.sol";

contract MultipleOperatorSameTypeSameFunctionSameDirectiveTest {
    function test_MultipleOperatorSameTypeSameFunctionSameDirective() public {
        C c = new C();
        assert(Int.unwrap(c.f()) == 5);
        assert(Int.unwrap(c.g()) == 7);
    }
}
