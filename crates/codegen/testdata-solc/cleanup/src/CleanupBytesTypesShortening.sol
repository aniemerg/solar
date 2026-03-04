// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CleanupBytesTypesShortening {
    function f() public pure returns (bytes32 r) {
        bytes4 x = 0xffffffff;
        bytes2 y = bytes2(x);
        assembly {
            r := y
        }
    }
}
