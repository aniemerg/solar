// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StorageArrayRef.sol";

contract StorageArrayRefTest {
    StorageArrayRef c;

    function setUp() public {
        c = new StorageArrayRef();
    }

    function test_StorageArrayRef() public {
        assert(c.findValue(7) == type(uint256).max);

        c.add(7);
        assert(c.findValue(7) == 0);

        c.add(11);
        c.add(17);
        c.add(27);
        c.add(31);
        c.add(32);
        c.add(66);
        c.add(177);

        assert(c.findValue(7) == 0);
        assert(c.findValue(27) == 3);
        assert(c.findValue(32) == 5);
        assert(c.findValue(176) == type(uint256).max);
        assert(c.findValue(0) == type(uint256).max);
        assert(c.findValue(400) == type(uint256).max);
    }
}
