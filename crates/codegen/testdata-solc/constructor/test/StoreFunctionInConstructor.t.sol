// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StoreFunctionInConstructor.sol";

contract StoreFunctionInConstructorTest {
    function test_StoreFunctionInConstructor() public {
        StoreFunctionInConstructor c = new StoreFunctionInConstructor();
        assert(c.use(3) == 6);
        assert(c.result_in_constructor() == 4);
    }
}
