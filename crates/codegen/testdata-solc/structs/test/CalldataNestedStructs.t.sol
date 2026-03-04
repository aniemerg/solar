// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataNestedStructs.sol";

contract CalldataNestedStructsTest {
    CalldataNestedStructs c;

    function setUp() public {
        c = new CalldataNestedStructs();
    }

    function _makeS1() internal pure returns (CalldataNestedStructs.S1 memory s1) {
        uint256[] memory a0 = new uint256[](2);
        a0[0] = 1;
        a0[1] = 2;
        uint256[] memory a1 = new uint256[](2);
        a1[0] = 0;
        a1[1] = 2;
        s1.u = 11;
        s1.s.p1 = 22;
        s1.s.a[0] = a0;
        s1.s.a[1] = a1;
        s1.s.p2 = 33;
    }

    function test_CalldataNestedStructs_f() public view {
        CalldataNestedStructs.S1 memory s1 = _makeS1();
        // f(S1{u:11, s:S{p1:22,...}}, 44) -> (44, 22, 1, 2, 33)
        (uint32 p, uint128 p1, uint256 a00, uint256 a11, uint32 p2) = c.f(s1, 44);
        assert(p == 44 && p1 == 22 && a00 == 1 && a11 == 2 && p2 == 33);
    }

    function test_CalldataNestedStructs_g() public view {
        // g(S2{array:[S{p1:22,a:[[1,2],[_,2]],p2:33}, S{p1:22,a:[[1,2],[_,2]],p2:33}]})
        // -> (array[1].p1, array[1].a[0][0], array[1].a[1][1], array[1].p2)
        uint256[] memory a0 = new uint256[](2);
        a0[0] = 1;
        a0[1] = 2;
        uint256[] memory a1 = new uint256[](2);
        a1[0] = 0;
        a1[1] = 2;
        CalldataNestedStructs.S2 memory s2;
        s2.array[0].p1 = 22;
        s2.array[0].a[0] = a0;
        s2.array[0].a[1] = a1;
        s2.array[0].p2 = 33;
        s2.array[1].p1 = 22;
        s2.array[1].a[0] = a0;
        s2.array[1].a[1] = a1;
        s2.array[1].p2 = 33;
        (uint128 p1, uint256 a00, uint256 a11, uint32 p2) = c.g(s2);
        assert(p1 == 22 && a00 == 1 && a11 == 2 && p2 == 33);
    }

    function test_CalldataNestedStructs_h() public view {
        CalldataNestedStructs.S1 memory s1 = _makeS1();
        (uint32 p, uint128 p1, uint256 a00, uint256 a11, uint32 p2) = c.h(s1, 44);
        assert(p == 44 && p1 == 22 && a00 == 1 && a11 == 2 && p2 == 33);
    }
}
