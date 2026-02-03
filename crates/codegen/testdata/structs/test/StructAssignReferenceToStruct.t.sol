// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructAssignReferenceToStruct.sol";

contract StructAssignReferenceToStructTest {
    StructAssignReferenceToStruct c;

    function setUp() public {
        c = new StructAssignReferenceToStruct();
    }

    function test_StructAssignReferenceToStruct() public {
        (uint256 a, uint256 b, uint256 d, uint256 e) = c.assign();
        assert(a == 2);
        assert(b == 2);
        assert(d == 3);
        assert(e == 3);
    }
}
