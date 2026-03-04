// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpOperatorConstSigned {
    function f() public pure returns (int d) { return (-2) ** 3; }
}
