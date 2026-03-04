// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StoreFunction.sol";

contract StoreFunctionTest {
    function test_storeAndEval() public {
        StoreFunction c = new StoreFunction();
        assert(c.t() == 9);
    }
}
