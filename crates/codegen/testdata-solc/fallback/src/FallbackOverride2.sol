// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A2 {
    fallback (bytes calldata _input) virtual external returns (bytes memory) {
        return _input;
    }
}
contract FallbackOverride2 is A2 {
    fallback () override external {
    }
    function f() public returns (bool, bytes memory) {
        (bool success, bytes memory retval) = address(this).call("abc");
        return (success, retval);
    }
}
