// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./FreeFunctionResolutionOverrideVirtualS1.sol";
contract D is C {
  function g() public pure override returns (uint) {
    return f();
  }
}
