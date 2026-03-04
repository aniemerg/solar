// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./ImportA.sol";
contract B is A {
    function f(uint256 x) public view returns(uint256) { return x; }
}
