// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/OperatorPrecedence.sol";

contract OperatorPrecedenceTest {
    function test_OperatorPrecedence() public {
        C c = new C();
        c.testBitwise();
        c.testBitwise_arithmetic();
        c.testArithmetic();
        c.testAll();
    }
}
