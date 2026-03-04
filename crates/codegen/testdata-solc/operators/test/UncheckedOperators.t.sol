// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UncheckedOperators.sol";

contract UncheckedOperatorsTest {
    function test_UncheckedOperators() public {
        D d = new D();
        // 250 + 10 = 260, wraps to 4 in uint8
        assert(U8.unwrap(d.testUncheckedOperator()) == 4);
        assert(U8.unwrap(d.testUncheckedOperatorInUncheckedBlock()) == 4);
    }
}
