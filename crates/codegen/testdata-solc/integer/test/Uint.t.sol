// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Uint.sol";

contract UintTest {
    function test_Uint() public {
        Uint c = new Uint();
        assert(c.uintMinA() == true);
        assert(c.uintMinB() == true);
        assert(c.uintMinC() == true);
        assert(c.uintMinD() == true);
        assert(c.uintMaxA() == true);
        assert(c.uintMaxB() == true);
        assert(c.uintMaxC() == true);
        assert(c.uintMaxD() == true);
    }
}
