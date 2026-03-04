// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UserDefinedTypesMappingStorage.sol";

contract UserDefinedTypesMappingStorageTest {
    UserDefinedTypesMappingStorage c;

    function setUp() public {
        c = new UserDefinedTypesMappingStorage();
    }

    function test_testAB() public {
        assert(c.testAB() == true);
    }

    function test_testUint() public {
        assert(c.testUint() == true);
    }
}
