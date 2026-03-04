// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStructs.sol";

contract CalldataStructsTest {
    CalldataStructs c;

    function setUp() public {
        c = new CalldataStructs();
    }

    function test_CalldataStructs() public view {
        CalldataStructs.S1 memory s1;
        s1.a = 1;
        s1.b = 2;
        CalldataStructs.S2 memory s2;
        s2.a = 3;
        CalldataStructs.S1 memory s3;
        s3.a = 4;
        s3.b = 5;
        (uint256 a, uint256 b, uint256 cc, uint256 d, uint256 e) = c.f(s1, s2, s3);
        assert(a == 1 && b == 2 && cc == 3 && d == 4 && e == 5);
    }
}
