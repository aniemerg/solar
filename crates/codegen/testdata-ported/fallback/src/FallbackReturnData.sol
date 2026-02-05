// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallbackReturnData {
    fallback(bytes calldata _input) external returns (bytes memory) {
        return _input;
    }

    function f() public returns (bool, bytes memory) {
        (bool success, bytes memory retval) = address(this).call("abc");
        return (success, retval);
    }
}
