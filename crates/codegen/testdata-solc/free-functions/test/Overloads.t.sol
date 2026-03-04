// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Overloads.sol";

contract OverloadsTest {
    function test_Overloads() public {
        Overloads c = new Overloads();
        (uint a, uint b) = c.g();
        assert(a == 2 && b == 3);
    }
}
