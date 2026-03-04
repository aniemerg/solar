// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibrariesFromFree.sol";

contract LibrariesFromFreeTest {
    function test_LibrariesFromFree() public {
        LibrariesFromFree c = new LibrariesFromFree();
        (uint a, uint b) = c.f();
        assert(a == 7 && b == 8);
    }
}
