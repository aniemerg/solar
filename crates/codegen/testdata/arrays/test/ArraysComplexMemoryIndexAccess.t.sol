// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArraysComplexMemoryIndexAccess.sol";

contract ArraysComplexMemoryIndexAccessTest {
    function makeInput() internal pure returns (uint24[3][] memory data) {
        data = new uint24[3][](6);
        uint24 value = 1;
        for (uint256 i = 0; i < 6; i++) {
            for (uint256 j = 0; j < 3; j++) {
                data[i][j] = value;
                value += 1;
            }
        }
    }

    function test_ArraysComplexMemoryIndexAccess() public {
        ArraysComplexMemoryIndexAccess c = new ArraysComplexMemoryIndexAccess();
        (uint256 length, uint256 element) = c.set(makeInput(), 3, 2);
        assert(length == 6);
        assert(element == 12);
    }
}
