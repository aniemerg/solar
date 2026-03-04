// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BareCallNoReturndatacopy {
    function f() public returns (bool) {
        // Random address, no contract deployed to it.
        (bool success, ) = address(0xffff).call("");
        return success;
    }
}
