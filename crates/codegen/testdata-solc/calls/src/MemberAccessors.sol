// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemberAccessors {
    uint256 public data;
    bytes6 public name;
    bytes32 public a_hash;
    address public an_address;
    uint256 super_secret_data; // private, no getter

    constructor() {
        data = 8;
        name = "Celina";
        a_hash = keccak256("\x7b");
        an_address = address(0x1337);
        super_secret_data = 42;
    }
}
