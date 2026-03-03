// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StateSmokeTest.sol";

contract StateSmokeTestTest {
    StateSmokeTest c;

    function setUp() public {
        c = new StateSmokeTest();
    }

    function test_StateSmokeTest() public {
        assert(c.get(0) == 0);
        assert(c.get(1) == 0);
        c.set(0, 0x1234);
        c.set(1, 0x8765);
        assert(c.get(0) == 0x1234);
        assert(c.get(1) == 0x8765);
        c.set(0, 0x03);
        assert(c.get(0) == 0x03);
    }
}
