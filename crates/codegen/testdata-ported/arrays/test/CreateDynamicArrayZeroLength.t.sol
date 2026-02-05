// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CreateDynamicArrayZeroLength.sol";

contract CreateDynamicArrayZeroLengthTest {
    function test_CreateDynamicArrayZeroLength() public {
        CreateDynamicArrayZeroLength c = new CreateDynamicArrayZeroLength();
        assert(c.f() == 7);
    }
}
