// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./ImportedFreeFunctionViaAliasS1.sol" as M;
function f() pure returns (uint) { return 6; }
contract D is M.C {
  function g() public pure override returns (uint) {
    return super.g() + f() * 10000;
  }
}
