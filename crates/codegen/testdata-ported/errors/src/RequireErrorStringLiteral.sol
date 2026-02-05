// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error CustomErrorString(string);

contract RequireErrorStringLiteral {
    function f() external pure {
        require(false, CustomErrorString("errorReason"));
    }

    function g() external pure {
        require(false, CustomErrorString("anotherReason"));
    }
}
