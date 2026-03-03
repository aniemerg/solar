// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstructorArgumentsExternal.sol";

contract ConstructorArgumentsExternalTest {
    function test_ConstructorArgumentsExternal() public {
        ConstructorArgumentsExternal c = new ConstructorArgumentsExternal("abc", true);
        assert(c.getFlag() == true);
        assert(c.getName() == bytes3("abc"));
    }
}
