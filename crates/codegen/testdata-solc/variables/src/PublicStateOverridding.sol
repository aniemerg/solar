// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    function test() external virtual returns (uint256) {
        return 5;
    }
}
contract PublicStateOverridding is A {
    uint256 public override test;

    function set() public { test = 2; }
}
