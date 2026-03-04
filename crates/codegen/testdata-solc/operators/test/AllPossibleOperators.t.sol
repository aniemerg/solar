// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AllPossibleOperators.sol";

contract AllPossibleOperatorsTest {
    function test_AllPossibleOperators() public {
        C c = new C();
        c.testBitwise();
        c.testArithmetic();
        c.testComparison();
    }
}
