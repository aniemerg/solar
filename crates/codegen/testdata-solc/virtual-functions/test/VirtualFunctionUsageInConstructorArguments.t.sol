// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/VirtualFunctionUsageInConstructorArguments.sol";

contract VirtualFunctionUsageInConstructorArgumentsTest {
    function test_VirtualFunctionUsageInConstructorArguments() public {
        VirtualFunctionUsageInConstructorArguments c = new VirtualFunctionUsageInConstructorArguments();
        // getA() -> 2  (overridden() returns 2, which is passed as constructor arg)
        assert(c.getA() == 2);
    }
}
