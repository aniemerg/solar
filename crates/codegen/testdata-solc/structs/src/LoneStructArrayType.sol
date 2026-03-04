// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LoneStructArrayType {
    struct s {
        uint256 a;
        uint256 b;
    }

    function f() public pure returns (uint256) {
        s[7][]; // This is only the type, should not have any effect
        return 3;
    }
}
