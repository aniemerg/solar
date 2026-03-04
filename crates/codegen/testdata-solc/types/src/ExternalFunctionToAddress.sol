// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExternalFunctionToAddress {
    function f() public view returns (bool) {
        return this.f.address == address(this);
    }
    function g(function() external cb) public pure returns (address) {
        return cb.address;
    }
}
