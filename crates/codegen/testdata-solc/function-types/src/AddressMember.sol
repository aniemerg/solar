// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressMember {
    function f() public view returns (address a1, address a2) {
        a1 = AddressMember(address(0x1234)).f.address;
        AddressMember(address(0x1234)).f.address;
        [AddressMember(address(0x1234)).f.address][0];
        a2 = [AddressMember(address(0x1234)).f.address][0];
    }
}
