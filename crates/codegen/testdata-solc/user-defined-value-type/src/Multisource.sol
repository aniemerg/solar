// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Adapted from multi-source test: type definitions inlined
type MyInt is int;
type MyAddress is address;

contract Multisource {
    function f(int x) external pure returns (MyInt) { return MyInt.wrap(x); }
    function fAddr(address x) external pure returns (MyAddress) { return MyAddress.wrap(x); }
}
