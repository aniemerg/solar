// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CreateMemoryArray.sol";

contract CreateMemoryArrayTest {
    CreateMemoryArray c;

    function setUp() public {
        c = new CreateMemoryArray();
    }

    function test_CreateMemoryArray() public view {
        (bytes1 a, uint256 b, uint256 d, bytes1 e) = c.f();
        assert(a == "A");
        assert(b == 8);
        assert(d == 4);
        assert(e == "B");
    }
}
