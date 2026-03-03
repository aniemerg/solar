// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImmutableSigned {
    int8 immutable a = -2;
    bytes2 immutable b = "ab";
    function() internal returns (uint) immutable f = g;

    function viaasm() external view returns (bytes32 x, bytes32 y) {
        int8 _a = a;
        bytes2 _b = b;
        assembly {
            x := _a
            y := _b
        }
    }

    function g() internal pure returns (uint) {
        return 2;
    }
}
