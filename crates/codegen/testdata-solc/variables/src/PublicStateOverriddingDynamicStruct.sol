// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct S { uint256 v; string s; }

contract BaseA {
    function test() external virtual returns (uint256 v, string memory s) {
        v = 42;
        s = "test";
    }
}
contract PublicStateOverriddingDynamicStruct is BaseA {
    S public override test;

    function set() public { test.v = 2; test.s = "statevar"; }
}
