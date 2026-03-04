// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingArgumentsInLibrary.sol";

contract MappingArgumentsInLibraryTest {
    MappingArgumentsInLibrary c;

    function setUp() public {
        c = new MappingArgumentsInLibrary();
    }

    function test_setAndGet() public {
        // set(uint256,uint256): 1, 42 -> 0 (old value)
        assert(c.set(1, 42) == 0);
        // set(uint256,uint256): 2, 84 -> 0
        assert(c.set(2, 84) == 0);
        // set(uint256,uint256): 21, 7 -> 0
        assert(c.set(21, 7) == 0);
        // get(uint256): 0 -> 0
        assert(c.get(0) == 0);
        // get(uint256): 1 -> 0x2a
        assert(c.get(1) == 0x2a);
        // get(uint256): 2 -> 0x54
        assert(c.get(2) == 0x54);
        // get(uint256): 21 -> 7
        assert(c.get(21) == 7);
        // set(uint256,uint256): 1, 21 -> 0x2a (old value)
        assert(c.set(1, 21) == 0x2a);
        // set(uint256,uint256): 2, 42 -> 0x54
        assert(c.set(2, 42) == 0x54);
        // set(uint256,uint256): 21, 14 -> 7
        assert(c.set(21, 14) == 7);
        // get(uint256): 0 -> 0
        assert(c.get(0) == 0);
        // get(uint256): 1 -> 0x15
        assert(c.get(1) == 0x15);
        // get(uint256): 2 -> 0x2a
        assert(c.get(2) == 0x2a);
        // get(uint256): 21 -> 14
        assert(c.get(21) == 14);
    }
}
