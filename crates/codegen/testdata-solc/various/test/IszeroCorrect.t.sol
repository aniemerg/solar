// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/IszeroCorrect.sol";

contract IszeroCorrectTest {
    IszeroCorrect c;

    function setUp() public {
        c = new IszeroCorrect();
    }

    function test_f() public {
        assert(c.f() == true);
    }
}
