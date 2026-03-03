// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingContractEnumsWithExplicitContractName.sol";

contract UsingContractEnumsWithExplicitContractNameTest {
    UsingContractEnumsWithExplicitContractName c;

    function setUp() public {
        c = new UsingContractEnumsWithExplicitContractName();
    }

    function test_UsingContractEnumsWithExplicitContractName() public view {
        assert(uint256(c.answer()) == 1);
    }
}
