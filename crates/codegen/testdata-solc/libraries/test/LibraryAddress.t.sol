// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryAddress.sol";

contract LibraryAddressTest {
    LibraryAddress c;

    function setUp() public {
        c = new LibraryAddress();
    }

    function test_addr() public view {
        // addr() -> false (library has non-zero address)
        assert(c.addr() == false);
    }

    function test_g() public view {
        // g(uint256): 1 -> 1, 2 -> 4, 4 -> 16
        assert(c.g(1) == 1);
        assert(c.g(2) == 4);
        assert(c.g(4) == 16);
    }

    function test_h() public {
        // h(uint256): 1 -> 1, 2 -> 4, 4 -> 16 (delegatecall to pure)
        assert(c.h(1) == 1);
        assert(c.h(2) == 4);
        assert(c.h(4) == 16);
    }

    function test_i() public {
        // i(uint256): 1 -> 1, 2 -> 4, 4 -> 16 (call to pure)
        assert(c.i(1) == 1);
        assert(c.i(2) == 4);
        assert(c.i(4) == 16);
    }

    function test_j() public {
        // j(uint256): 1 -> 1, 2 -> 4, 4 -> 16 (delegatecall to non-pure)
        assert(c.j(1) == 1);
        assert(c.j(2) == 4);
        assert(c.j(4) == 16);
    }
}
