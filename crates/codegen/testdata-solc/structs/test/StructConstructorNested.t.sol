// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructConstructorNested.sol";

contract StructConstructorNestedTest {
    StructConstructorNested c;

    function setUp() public {
        c = new StructConstructorNested();
    }

    function test_StructConstructorNested() public view {
        (uint256 s1, uint256[3] memory s2, uint256 x1, uint256 x2) = c.get();
        assert(s1 == 1);
        assert(s2[0] == 0 && s2[1] == 9 && s2[2] == 0);
        assert(x1 == 4 && x2 == 5);
    }
}
