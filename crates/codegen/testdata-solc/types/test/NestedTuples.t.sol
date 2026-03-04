// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NestedTuples.sol";

contract NestedTuplesTest {
    NestedTuples c;

    function setUp() public {
        c = new NestedTuples();
    }

    function test_f0() public view {
        (int a, bool b) = c.f0();
        assert(a == 2);
        assert(b == true);
    }

    function test_f1() public view {
        assert(c.f1() == 1);
    }

    function test_f2() public view {
        assert(c.f2() == 2);
    }

    function test_f3() public view {
        assert(c.f3() == 3);
    }

    function test_f4() public view {
        assert(c.f4() == 4);
    }
}
