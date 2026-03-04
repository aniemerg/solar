// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryAddressHomestead.sol";

contract LibraryAddressHomesteadTest {
    LibraryAddressHomestead c;

    function setUp() public {
        c = new LibraryAddressHomestead();
    }

    function test_g_valid() public {
        // g(uint256,uint256): 1, 1 -> true
        assert(c.g(1, 1) == true);
        // g(uint256,uint256): 2, 4 -> true
        assert(c.g(2, 4) == true);
        // g(uint256,uint256): 4, 16 -> true
        assert(c.g(4, 16) == true);
    }

    function test_g_invalid() public {
        // g(uint256,uint256): 1, 2 -> false
        assert(c.g(1, 2) == false);
        // g(uint256,uint256): 2, 3 -> false
        assert(c.g(2, 3) == false);
        // g(uint256,uint256): 4, 15 -> false
        assert(c.g(4, 15) == false);
        // g(uint256,uint256): 4, 17 -> false
        assert(c.g(4, 17) == false);
    }
}
