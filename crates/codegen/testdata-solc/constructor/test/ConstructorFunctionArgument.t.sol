// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstructorFunctionArgument.sol";

contract Helper {
    function dummy() external returns (uint) {
        return 0;
    }
}

contract ConstructorFunctionArgumentTest {
    function test_ConstructorFunctionArgument() public {
        Helper h = new Helper();
        // Constructor accepts an external function pointer; just verify deployment succeeds
        ConstructorFunctionArgument d = new ConstructorFunctionArgument(h.dummy);
        assert(address(d) != address(0));
    }
}
