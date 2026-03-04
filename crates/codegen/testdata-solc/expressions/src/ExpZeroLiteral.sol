// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpZeroLiteral {
    function f() public pure returns (uint d) { return 0 ** 0; }
}
