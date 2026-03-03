// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    fallback (bytes calldata _input) virtual external returns (bytes memory) {
        return _input;
    }
}
contract FallbackOverride is A {
    fallback (bytes calldata _input) override external returns (bytes memory) {
        return "xyz";
    }
    function f() public returns (bool, bytes memory) {
        (bool success, bytes memory retval) = address(this).call("abc");
        return (success, retval);
    }
}
