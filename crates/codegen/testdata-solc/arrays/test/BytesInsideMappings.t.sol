// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BytesInsideMappings.sol";

contract BytesInsideMappingsTest {
    function test_BytesInsideMappings() public {
        BytesInsideMappings c = new BytesInsideMappings();
        // set(uint256): 1, 2 -> true
        assert(c.set(1) == true);
        // set(uint256): 2, 2, 3, 4, 5 -> true
        assert(c.set(2) == true);
        // copy(uint256,uint256): 1, 2 -> true
        assert(c.copy(1, 2) == true);
        // copy(uint256,uint256): 99, 1 -> true
        assert(c.copy(99, 1) == true);
        // copy(uint256,uint256): 99, 2 -> true
        assert(c.copy(99, 2) == true);
    }
}
