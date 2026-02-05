// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NoNonpayableCircumventionByModifier {
    modifier tryCircumvent() {
        if (false) _;
    }

    function f() public tryCircumvent returns (uint256) {
        return msgvalue();
    }

    function msgvalue() internal view returns (uint256) {
        return msg.value;
    }
}
