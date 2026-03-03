// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StoreFunctionInConstructorPacked.sol";

contract StoreFunctionInConstructorPackedTest {
    function test_StoreFunctionInConstructorPacked() public {
        StoreFunctionInConstructorPacked c = new StoreFunctionInConstructorPacked();
        // use(3) = ~(3*2) = ~6 = 0xfff9
        assert(c.use(3) == 0xfff9);
        // result_in_constructor = use(2) = ~(2*2) = ~4 = 0xfffb
        assert(c.result_in_constructor() == 0xfffb);
        assert(c.other() == 0x1fff);
    }
}
