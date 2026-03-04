// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/OperatorDefinitionShadowingBuiltinKeccak256.sol";

contract OperatorDefinitionShadowingBuiltinKeccak256Test {
    function test_OperatorDefinitionShadowingBuiltinKeccak256() public {
        C c = new C();
        assert(Int.unwrap(c.test()) == 7);
    }
}
