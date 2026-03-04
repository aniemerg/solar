// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/RecursiveStorageMemoryComplex.sol";

contract RecursiveStorageMemoryComplexTest {
    RecursiveStorageMemoryComplex c;

    function setUp() public {
        c = new RecursiveStorageMemoryComplex();
    }

    function test_RecursiveStorageMemoryComplex() public {
        uint256[] memory result = c.run();
        assert(result.length == 10);
        assert(result[0] == 0x42);
        assert(result[1] == 0x4200);
        assert(result[2] == 0x420000);
        assert(result[3] == 0x420001);
        assert(result[4] == 0x420002);
        assert(result[5] == 0x4201);
        assert(result[6] == 0x420100);
        assert(result[7] == 0x420101);
        assert(result[8] == 0x420102);
        assert(result[9] == 0x420103);
    }
}
