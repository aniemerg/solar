// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStructAsArgumentOfLibFunction.sol";

contract CalldataStructAsArgumentOfLibFunctionTest {
    CalldataStructAsArgumentOfLibFunction c;

    function setUp() public {
        c = new CalldataStructAsArgumentOfLibFunction();
    }

    function test_CalldataStructAsArgumentOfLibFunction() public view {
        // f(S1{u:11, s:S{p1:22, a:[[1,2],[_,2]], p2:33}}, 44) -> (44, 22, 1, 2, 33)
        uint256[] memory a0 = new uint256[](2);
        a0[0] = 1;
        a0[1] = 2;
        uint256[] memory a1 = new uint256[](2);
        a1[0] = 0;
        a1[1] = 2;
        CalldataLibS memory s;
        s.p1 = 22;
        s.a[0] = a0;
        s.a[1] = a1;
        s.p2 = 33;
        CalldataLibS1 memory s1;
        s1.u = 11;
        s1.s = s;
        (uint32 p, uint128 p1, uint256 a00, uint256 a11, uint32 p2) = c.f(s1, 44);
        assert(p == 44 && p1 == 22 && a00 == 1 && a11 == 2 && p2 == 33);
    }
}
