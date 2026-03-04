// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CodeLengthContractMember.sol";

contract CodeLengthContractMemberTest {
    CodeLengthContractMember c;

    function setUp() public {
        c = new CodeLengthContractMember();
    }

    function test_f() public {
        (uint256 codeLen, uint256 anotherLen, bool hasCode) = c.f();
        // bytes32 field .length is 32
        assert(codeLen == 0x20);
        assert(anotherLen == 0x20);
        assert(hasCode == true);
    }
}
