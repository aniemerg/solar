// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataArrayLength.sol";

contract CalldataArrayLengthTest {
    function test_CalldataArrayLength_1d() public {
        CalldataArrayLength c = new CalldataArrayLength();
        uint256[] memory empty = new uint256[](0);
        uint256[] memory one = new uint256[](1);
        one[0] = 23;
        uint256[] memory two = new uint256[](2);
        two[0] = 23;
        two[1] = 42;
        uint256[] memory three = new uint256[](3);
        three[0] = 23;
        three[1] = 42;
        three[2] = 17;

        assert(c.len1(empty) == 0);
        assert(c.len1(one) == 1);
        assert(c.len1(two) == 2);
        assert(c.len1(three) == 3);
    }

    function test_CalldataArrayLength_2d() public {
        CalldataArrayLength c = new CalldataArrayLength();

        uint256[][] memory empty = new uint256[][](0);
        (uint256 l1, uint256 l2, uint256 l3) = c.len2(empty);
        assert(l1 == 0 && l2 == 0 && l3 == 0);

        uint256[][] memory one = new uint256[][](1);
        one[0] = new uint256[](0);
        (l1, l2, l3) = c.len2(one);
        assert(l1 == 1 && l2 == 0 && l3 == 0);

        uint256[][] memory oneWith = new uint256[][](1);
        oneWith[0] = new uint256[](2);
        oneWith[0][0] = 23;
        oneWith[0][1] = 42;
        (l1, l2, l3) = c.len2(oneWith);
        assert(l1 == 1 && l2 == 2 && l3 == 0);

        uint256[][] memory two = new uint256[][](2);
        two[0] = new uint256[](2);
        two[1] = new uint256[](1);
        two[0][0] = 23;
        two[0][1] = 42;
        two[1][0] = 17;
        (l1, l2, l3) = c.len2(two);
        assert(l1 == 2 && l2 == 2 && l3 == 1);
    }

    function test_CalldataArrayLength_Fixed() public {
        CalldataArrayLength c = new CalldataArrayLength();
        uint256[2] memory fixed_ = [uint256(23), uint256(42)];
        assert(c.lenFixed(fixed_) == 2);
    }
}
