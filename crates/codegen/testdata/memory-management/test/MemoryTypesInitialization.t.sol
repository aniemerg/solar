// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MemoryTypesInitialization.sol";

contract MemoryTypesInitializationTest {
    function test_MemoryTypesInitialization() public {
        MemoryTypesInitialization c = new MemoryTypesInitialization();
        uint256[5] memory stat = c.stat();
        for (uint256 i = 0; i < 5; i++) {
            assert(stat[i] == 0);
        }

        uint256[] memory dyn = c.dyn();
        assert(dyn.length == 0);

        uint256[3][] memory nested = c.nested();
        assert(nested.length == 0);

        uint256[3][7] memory nestedStat = c.nestedStat();
        for (uint256 i = 0; i < 7; i++) {
            for (uint256 j = 0; j < 3; j++) {
                assert(nestedStat[i][j] == 0);
            }
        }
    }
}
