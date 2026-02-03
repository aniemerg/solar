// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReceiveInheritedA {
    uint256 data;
    receive() external payable { ++data; }
    function getData() public view returns (uint256) { return data; }
}

contract ReceiveInheritedB is ReceiveInheritedA {}
