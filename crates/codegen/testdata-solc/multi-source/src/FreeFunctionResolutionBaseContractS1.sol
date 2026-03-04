// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
function f() pure returns (uint) { return 1337; }
contract C {
  function g() public pure returns (uint) {
    return f();
  }
}
