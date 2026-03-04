// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AsmConstantFileLevel.sol";

contract AsmConstantFileLevelTest {
    function test_AsmConstantFileLevel() public {
        AsmConstantFileLevel c = new AsmConstantFileLevel();
        assert(c.f() == 0x1212121212121212121212121000002134593163);
    }
}
