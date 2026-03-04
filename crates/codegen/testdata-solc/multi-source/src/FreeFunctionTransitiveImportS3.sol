// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./FreeFunctionTransitiveImportS2.sol";
import {f as f} from "./FreeFunctionTransitiveImportS2.sol";
contract E is D {
  function i() public pure returns (uint) {
    return f();
  }
}
