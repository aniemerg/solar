// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunReadInCtor.sol";

contract FunReadInCtorTest {
    function test_FunReadInCtor() public {
        FunReadInCtor c = new FunReadInCtor();
        assert(c.readX() == 3);
        assert(c.readA() == 3);
    }
}
