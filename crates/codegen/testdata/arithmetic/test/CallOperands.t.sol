// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CallOperands.sol";

contract CallOperandsTest is CallOperandOps {
    function test_CallOperandOps() public {
        exercise();
        assert(true);
    }
}
