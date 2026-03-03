// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstructorArgumentsInternal.sol";

contract ConstructorArgumentsInternalTest {
    function test_ConstructorArgumentsInternal() public {
        ConstructorArgumentsInternal c = new ConstructorArgumentsInternal();
        assert(c.getFlag() == true);
        assert(c.getName() == "abc");
    }
}
