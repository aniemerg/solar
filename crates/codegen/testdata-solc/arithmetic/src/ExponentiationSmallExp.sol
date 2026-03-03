// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExponentiationSmallExp {
    function f() public pure returns (uint256 r) {
        uint32 x;
        uint8 y;
        assembly {
            x := 0xfffffffffe
            y := 0x102
        }
        unchecked {
            r = x ** y;
        }
        return r;
    }
}
