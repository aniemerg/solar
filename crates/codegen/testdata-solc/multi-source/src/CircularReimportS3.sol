// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./CircularReimportS1.sol";
contract C {
  function foo() public pure returns (uint) {
    return f() - g() - h();
  }
}
