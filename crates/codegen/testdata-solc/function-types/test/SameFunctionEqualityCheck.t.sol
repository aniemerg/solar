// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SameFunctionEqualityCheck.sol";

contract SameFunctionEqualityCheckTest {
    function test_equalityCheck() public {
        SameFunctionEqualityCheck c = new SameFunctionEqualityCheck();
        assert(c.checkEquality() == true);
    }
}
