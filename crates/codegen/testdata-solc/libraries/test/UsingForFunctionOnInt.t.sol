// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingForFunctionOnInt.sol";

contract UsingForFunctionOnIntTest {
    UsingForFunctionOnInt c;

    function setUp() public {
        c = new UsingForFunctionOnInt();
    }

    function test_f() public {
        // f(uint256): 9 -> 18
        assert(c.f(9) == 18);
    }
}
