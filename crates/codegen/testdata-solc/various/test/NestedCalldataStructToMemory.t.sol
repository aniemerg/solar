// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NestedCalldataStructToMemory.sol";

contract NestedCalldataStructToMemoryTest {
    NestedCalldataStructToMemory c;

    function setUp() public {
        c = new NestedCalldataStructToMemory();
    }

    function test_f() public {
        NestedCalldataStructToMemory.S1 memory s1 = NestedCalldataStructToMemory.S1({a: 3, b: 4});
        NestedCalldataStructToMemory.S2 memory s2 =
            NestedCalldataStructToMemory.S2({a: 1, b: 2, s: s1, c: 5});
        (uint256 a, uint256 b, uint256 sa, uint256 sb, uint256 cc) = c.f(s2);
        assert(a == 1);
        assert(b == 2);
        assert(sa == 3);
        assert(sb == 4);
        assert(cc == 5);
    }
}
