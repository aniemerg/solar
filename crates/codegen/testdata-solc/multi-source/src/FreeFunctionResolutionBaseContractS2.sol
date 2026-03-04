// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./FreeFunctionResolutionBaseContractS1.sol";
contract D is C {
  function h() public pure returns (uint) {
    return g();
  }
}
