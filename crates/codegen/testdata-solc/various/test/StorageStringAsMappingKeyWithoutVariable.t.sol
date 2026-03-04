// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StorageStringAsMappingKeyWithoutVariable.sol";

contract StorageStringAsMappingKeyWithoutVariableTest {
    StorageStringAsMappingKeyWithoutVariable c;

    function setUp() public {
        c = new StorageStringAsMappingKeyWithoutVariable();
    }

    function test_f() public {
        assert(c.f() == 2);
    }
}
