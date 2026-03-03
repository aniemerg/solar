// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GetterCallInConstructor.sol";

contract GetterCallInConstructorTest {
    function test_GetterCallInConstructor() public {
        GetterCallInConstructor c = new GetterCallInConstructor();
        // Calling x() via this inside constructor should revert
        assert(c.f() == true);
    }
}
