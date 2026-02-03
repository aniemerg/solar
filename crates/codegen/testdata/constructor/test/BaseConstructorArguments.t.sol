// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BaseConstructorArguments.sol";

contract BaseConstructorArgumentsTest {
    function test_BaseConstructorArguments() public {
        BaseConstructorArguments c = new BaseConstructorArguments();
        assert(c.getA() == 49);
    }
}
