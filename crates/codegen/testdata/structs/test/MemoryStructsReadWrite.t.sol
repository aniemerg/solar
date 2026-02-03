// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MemoryStructsReadWrite.sol";

contract MemoryStructsReadWriteTest {
    MemoryStructsReadWrite c;

    function setUp() public {
        c = new MemoryStructsReadWrite();
    }

    function test_MemoryStructsReadWrite() public {
        (uint8 x, uint16 y, uint256 z, uint8 a, bool flag) = c.testInit();
        assert(x == 0 && y == 0 && z == 0 && a == 0 && flag == true);

        (x, y, z, a) = c.testCopyRead();
        assert(x == 1 && y == 2 && z == 3 && a == 4);

        (x, y, z, a) = c.testAssign();
        assert(x == 1 && y == 2 && z == 3 && a == 4);
    }
}
