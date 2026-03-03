// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionUsageInConstructorArguments.sol";

contract FunctionUsageInConstructorArgumentsTest {
    function test_FunctionUsageInConstructorArguments() public {
        Derived d = new Derived();
        assert(d.getA() == 2);
    }
}
