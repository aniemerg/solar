// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./FreeFunctionResolutionOverrideVirtualTransitiveS2.sol";
contract E is D {
  function g() public pure override returns (uint) {
    return super.g() + 1;
  }
}
