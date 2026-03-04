// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./FreeFunctionResolutionOverrideVirtualTransitiveS1.sol";
contract D is C {
  function g() public pure virtual override returns (uint) {
    return super.g() + 1;
  }
}
