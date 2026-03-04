// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct S2 { uint256 v; string s; }

contract BaseA2 {
    function test(uint256 x) external virtual returns (uint256 v, string memory s) {
        v = x;
        s = "test";
    }
}
contract PublicStateOverriddingMappingToDynamicStruct is BaseA2 {
    mapping(uint256 => S2) public override test;

    function set() public { test[42].v = 2; test[42].s = "statevar"; }
}
