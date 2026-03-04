// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AsFunction.sol";

contract AsFunctionTest {
    function test_underscore_function() public {
        AsFunction c = new AsFunction();
        assert(c._() == 88);
    }

    function test_g() public {
        AsFunction c = new AsFunction();
        assert(c.g() == 88);
    }

    function test_h() public {
        AsFunction c = new AsFunction();
        assert(c.h() == 33);
    }
}
