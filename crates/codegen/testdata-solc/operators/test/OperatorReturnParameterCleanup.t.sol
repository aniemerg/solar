// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/OperatorReturnParameterCleanup.sol";

contract OperatorReturnParameterCleanupTest {
    function test_OperatorReturnParameterCleanup() public {
        C c = new C();
        (uint opFull, uint fFull) = c.testUnary();
        assert(opFull == 0xffff);
        assert(fFull == 0xffff);
        (uint addFull, uint gFull) = c.testBinary();
        assert(addFull == 0xffff);
        assert(gFull == 0xffff);
    }
}
