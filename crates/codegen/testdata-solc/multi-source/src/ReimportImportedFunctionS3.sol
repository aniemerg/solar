// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {g as h} from "./ReimportImportedFunctionS2.sol";
contract C {
  function foo() public pure returns (uint) {
    return h();
  }
}
