// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Reverts {
    constructor(uint) { revert("test message."); }
}
contract Succeeds {
    constructor(uint) { }
}

contract TryCatchCreate {
    function f() public returns (bool created, string memory txt) {
        uint i = 3;
        try new Reverts(i) returns (Reverts r) {
            created = (address(r) != address(0));
            txt = "success";
        } catch Error(string memory s) {
            txt = s;
        }
    }
    function g() public returns (bool created, string memory txt) {
        uint i = 8;
        try new Succeeds(i) returns (Succeeds r) {
            created = (address(r) != address(0));
            txt = "success";
        } catch Error(string memory s) {
            txt = s;
        }
    }
}
