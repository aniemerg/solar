// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStruct.sol";

contract CalldataStructTest {
    CalldataStruct c;

    function setUp() public {
        c = new CalldataStruct();
    }

    function test_CalldataStruct() public view {
        SCalldata memory s = SCalldata({x: 66, y: 77});
        (uint256 r0, uint256 r1) = c.test(7, s, 4);
        assert(r0 == 77);
        assert(r1 == 66);
    }
}
