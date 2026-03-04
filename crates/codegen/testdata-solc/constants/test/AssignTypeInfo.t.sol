// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AssignTypeInfo.sol";

contract AssignTypeInfoTest {
    function test_AssignTypeInfo() public {
        AssignTypeInfo c = new AssignTypeInfo();
        assert(c.nonEmptyCode() == true);
    }
}
