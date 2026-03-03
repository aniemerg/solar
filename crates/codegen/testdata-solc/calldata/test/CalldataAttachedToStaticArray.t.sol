// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataAttachedToStaticArray.sol";

contract CalldataAttachedToStaticArrayTest {
    CalldataAttachedToStaticArray c;

    function setUp() public {
        c = new CalldataAttachedToStaticArray();
    }

    function test_CalldataAttachedToStaticArray() public view {
        uint256[2] memory a = [uint256(66), uint256(77)];
        (uint256 r0, uint256 r1) = c.test(7, a, 4);
        assert(r0 == 77);
        assert(r1 == 66);
    }
}
