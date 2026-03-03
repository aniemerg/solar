// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallbackArgumentToStorage {
    bytes public x;
    fallback (bytes calldata _input) external returns (bytes memory) {
        x = _input;
        return "";
    }
    function f() public returns (bool, bytes memory) {
        (bool success, bytes memory retval) = address(this).call("abc");
        return (success, retval);
    }
}
