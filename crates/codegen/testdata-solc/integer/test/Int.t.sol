// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Int.sol";

contract IntTest {
    function test_Int() public {
        Int c = new Int();
        assert(c.intMinA() == true);
        assert(c.intMinB() == true);
        assert(c.intMinC() == true);
        assert(c.intMinD() == true);
        assert(c.intMaxA() == true);
        assert(c.intMaxB() == true);
        assert(c.intMaxC() == true);
        assert(c.intMaxD() == true);
    }
}
