// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/CalldataArrayOfStructToMemory.sol";

contract CalldataArrayOfStructToMemoryTest {
    function test_CalldataArrayOfStructToMemory() public {
        CalldataArrayOfStructToMemory c = new CalldataArrayOfStructToMemory();
        // f((uint256,uint256)[]): 0x20, 0x2, 0x1, 0x2, 0x3, 0x4 -> 2, 1, 2, 3, 4
        CalldataArrayOfStructToMemory.S[] memory inp = new CalldataArrayOfStructToMemory.S[](2);
        inp[0] = CalldataArrayOfStructToMemory.S(1, 2);
        inp[1] = CalldataArrayOfStructToMemory.S(3, 4);
        (uint256 l, uint256 a, uint256 b, uint256 cc, uint256 d) = c.f(inp);
        assert(l == 2);
        assert(a == 1);
        assert(b == 2);
        assert(cc == 3);
        assert(d == 4);
    }
}
