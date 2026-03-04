// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {f as g} from "./CircularImportS1.sol";
function f() pure returns (uint) { return 2; }
contract C {
  function foo() public pure returns (uint) {
    return f() - g();
  }
}
