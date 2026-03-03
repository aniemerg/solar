// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PackedFunctions.sol";

contract PackedFunctionsTest {
    PackedFunctions c;

    function setUp() public {
        c = new PackedFunctions();
    }

    function test_PackedFunctions() public {
        c.set();
        assert(c.t1() == 7);
        assert(c.t2() == 8);
        assert(c.t3() == 7);
        assert(c.t4() == 8);
        assert(c.x() == 2);
    }
}
