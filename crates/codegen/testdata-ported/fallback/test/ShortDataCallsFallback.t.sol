// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShortDataCallsFallback.sol";

contract ShortDataCallsFallbackTest {
    ShortDataCallsFallback c;

    function setUp() public {
        c = new ShortDataCallsFallback();
    }

    function test_ShortDataCallsFallback() public {
        (bool ok1,) = address(c).call(hex"d88e0b");
        assert(ok1);
        assert(c.x() == 2);

        (bool ok2,) = address(c).call(hex"d88e0b00");
        assert(ok2);
        assert(c.x() == 3);

        (bool ok3,) = address(c).call(hex"d88e");
        assert(ok3);
        assert(c.x() == 2);

        (bool ok4,) = address(c).call(hex"d88e0b00");
        assert(ok4);
        assert(c.x() == 3);

        (bool ok5,) = address(c).call(hex"d8");
        assert(ok5);
        assert(c.x() == 2);
    }
}
