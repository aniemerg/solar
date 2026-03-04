// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Test to see if type.code.length does extcodesize(type) only when type is an address.
struct CodeLengthContractMemberS {
    bytes32 code;
    bytes32 another;
}

contract CodeLengthContractMember {
    CodeLengthContractMemberS s;

    function f() public returns (uint256, uint256, bool) {
        return (s.code.length, s.another.length, address(this).code.length > 50);
    }
}
