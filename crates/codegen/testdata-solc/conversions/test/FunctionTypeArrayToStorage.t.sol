// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionTypeArrayToStorage.sol";

contract FunctionTypeArrayToStorageTest {
    function test_testViewToDefault() public {
        FunctionTypeArrayToStorage c = new FunctionTypeArrayToStorage();
        (uint a, uint b) = c.testViewToDefault();
        assert(a == 12);
        assert(b == 22);
    }

    function test_testPureToDefault() public {
        FunctionTypeArrayToStorage c = new FunctionTypeArrayToStorage();
        (uint a, uint b) = c.testPureToDefault();
        assert(a == 13);
        assert(b == 23);
    }

    function test_testPureToView() public {
        FunctionTypeArrayToStorage c = new FunctionTypeArrayToStorage();
        (uint a, uint b) = c.testPureToView();
        assert(a == 13);
        assert(b == 23);
    }
}
