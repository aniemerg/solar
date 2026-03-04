// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AllPossibleUserDefinedValueTypesWithOperators.sol";

contract AllPossibleUserDefinedValueTypesWithOperatorsTest {
    function test_AllPossibleUserDefinedValueTypesWithOperators() public {
        C c = new C();
        c.testIntBinary();
        c.testIntUnary();
        c.testUintBinary();
        c.testUintUnary();
        c.testBytesBinary();
        c.testBytesUnary();
        c.testOtherBinary();
        c.testOtherUnary();
    }
}
