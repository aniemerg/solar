// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./CircularReimport2S2.sol";
contract C {
  function foo() public pure returns (uint) {
    return 10000 + f() - g() - h();
  }
}
