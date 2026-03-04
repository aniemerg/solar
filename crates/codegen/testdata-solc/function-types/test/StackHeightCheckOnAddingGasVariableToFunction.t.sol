// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StackHeightCheckOnAddingGasVariableToFunction.sol";

contract StackHeightCheckOnAddingGasVariableToFunctionTest {
    function test_gasVariableStackHeight() public {
        StackHeightCheckOnAddingGasVariableToFunction c = new StackHeightCheckOnAddingGasVariableToFunction();
        assert(c.run_checks() == true);
    }
}
