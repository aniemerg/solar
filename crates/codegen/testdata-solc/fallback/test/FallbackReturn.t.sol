// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FallbackReturn.sol";

contract FallbackReturnTest {
    FallbackReturn c;

    function setUp() public {
        c = new FallbackReturn();
    }

    function test_FallbackReturn() public {
        (bool ok1,) = address(c).call("");
        assert(ok1);
        assert(c.x() == 1);
        (bool ok2,) = address(c).call("");
        assert(ok2);
        assert(c.x() == 2);
        (bool ok3,) = address(c).call("");
        assert(ok3);
        assert(c.x() == 2);
    }
}
