// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressCode {
    bytes public initCode;

    constructor() {
        // During construction address(this).code.length is 0
        assert(address(this).code.length == 0);
        initCode = address(this).code;
    }

    // To avoid dependency on exact length.
    function f() public view returns (bool) {
        return address(this).code.length > 380;
    }

    function g() public view returns (uint256) {
        return address(0).code.length;
    }

    function h() public view returns (uint256) {
        return address(1).code.length;
    }
}
