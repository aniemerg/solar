// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStructWithNestedArrayToStorage.sol";

contract CalldataStructWithNestedArrayToStorageTest {
    CalldataStructWithNestedArrayToStorage c;

    function setUp() public {
        c = new CalldataStructWithNestedArrayToStorage();
    }

    function test_CalldataStructWithNestedArrayToStorage() public {
        // f(55, S{p1:77, a:[[1,2],[_,2]], p2:88}) -> (55, 77, 1, 2, 88)
        uint256[] memory a0 = new uint256[](2);
        a0[0] = 1;
        a0[1] = 2;
        uint256[] memory a1 = new uint256[](2);
        a1[0] = 0;
        a1[1] = 2;
        CalldataStructWithNestedArrayToStorage.S memory s;
        s.p1 = 77;
        s.a[0] = a0;
        s.a[1] = a1;
        s.p2 = 88;
        (uint32 p1out, uint128 p1s, uint256 a00, uint256 a11, uint32 p2s) = c.f(55, s);
        assert(p1out == 55 && p1s == 77 && a00 == 1 && a11 == 2 && p2s == 88);
    }
}
