// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {f as g} from "./ImportedFreeFunctionViaAliasDirectCallS1.sol";
function f() pure returns (uint) { return 6; }
contract D {
  function h() public pure returns (uint) {
    return g() + f() * 10000;
  }
}
