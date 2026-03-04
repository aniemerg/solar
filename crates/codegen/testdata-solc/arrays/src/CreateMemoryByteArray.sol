// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreateMemoryByteArray {
    function f() public returns (bytes1) {
        bytes memory x = new bytes(35);
        assert(x.length == 35);
        x[34] = "A";
        return (x[34]);
    }
}
