// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MA {
    fallback (bytes calldata _input) virtual external returns (bytes memory) {
        return _input;
    }
}
contract MB {
    fallback (bytes calldata _input) virtual external returns (bytes memory) {
        return "xyz";
    }
}
contract FallbackOverrideMulti is MB, MA {
    fallback () external override (MB, MA) {}
    function f() public returns (bool, bytes memory) {
        (bool success, bytes memory retval) = address(this).call("abc");
        return (success, retval);
    }
}
