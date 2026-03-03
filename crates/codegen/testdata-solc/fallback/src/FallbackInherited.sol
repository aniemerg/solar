// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    uint data;
    fallback() external { data = 1; }
    function getData() public returns (uint r) { return data; }
}
contract FallbackInherited is A {}
