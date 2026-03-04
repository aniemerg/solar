// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionExternalDeleteStorage.sol";

contract FunctionExternalDeleteStorageTest {
    function test_externalDeleteStorage() public {
        FunctionExternalDeleteStorage c = new FunctionExternalDeleteStorage();
        assert(c.isF() == false);
        assert(c.isZero() == true);
        c.deleteFunction();
        assert(c.isF() == false);
        assert(c.isZero() == true);
        c.set();
        assert(c.isF() == true);
        assert(c.isZero() == false);
        c.deleteFunction();
        assert(c.isF() == false);
        assert(c.isZero() == true);
    }
}
