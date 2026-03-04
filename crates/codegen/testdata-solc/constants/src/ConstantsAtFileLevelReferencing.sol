// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ConstantsAtFileLevelReferencingHelper.sol";

uint256 constant c = uint8(a[0]) + 2;

contract ConstantsAtFileLevelReferencing {
    function f() public pure returns (bytes memory) {
        return a;
    }

    function g() public pure returns (bytes memory) {
        return b;
    }

    function h() public pure returns (uint) {
        return c;
    }

    function i() public pure returns (bytes memory) {
        return fre();
    }
}
