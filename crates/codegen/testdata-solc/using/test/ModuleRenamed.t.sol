// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ModuleRenamed.sol";

contract ModuleRenamedTest {
    ModuleRenamed c;

    function setUp() public {
        c = new ModuleRenamed();
    }

    function test_run() public view {
        // test(uint256,uint256): 1, 1 -> 9, 3
        // x.fMethod() = B.f(x) = A.g(x) = x+8 = 9
        // y.gMethod() = B.g(y) = A.f(y) = y+2 = 3
        (uint a, uint b) = c.run(1, 1);
        assert(a == 9);
        assert(b == 3);
    }
}
