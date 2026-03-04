// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisorderedNamedArgs {
    function a(uint a, uint b, uint c) public pure returns (uint r) { r = a * 100 + b * 10 + c * 1; }
    function b() public pure returns (uint r) { r = a({c: 3, a: 1, b: 2}); }
}
