// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CrossContractTypes.sol";

contract CrossContractTypesTest {
    CrossContractTypes c;

    function setUp() public {
        c = new CrossContractTypes();
    }

    function test_f() public {
        assert(c.f() == 3);
    }
}
