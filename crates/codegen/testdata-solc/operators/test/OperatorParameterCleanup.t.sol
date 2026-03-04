// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/OperatorParameterCleanup.sol";

contract OperatorParameterCleanupTest {
    function test_OperatorParameterCleanup() public {
        C c = new C();
        (U8 opResult, U8 fResult) = c.testUnary();
        assert(U8.unwrap(opResult) == 0x42);
        assert(U8.unwrap(fResult) == 0x42);
        (U8 addResult, U8 addFResult) = c.testBinary();
        assert(U8.unwrap(addResult) == 0x84);
        assert(U8.unwrap(addFResult) == 0x84);
    }
}
