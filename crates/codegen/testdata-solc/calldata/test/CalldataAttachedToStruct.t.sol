// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataAttachedToStruct.sol";

contract CalldataAttachedToStructTest {
    CalldataAttachedToStruct c;

    function setUp() public {
        c = new CalldataAttachedToStruct();
    }

    function test_CalldataAttachedToStruct() public view {
        SAttached memory s = SAttached({x: 66, y: 77});
        (uint256 r0, uint256 r1) = c.test(7, s, 4);
        assert(r0 == 77);
        assert(r1 == 66);
    }
}
