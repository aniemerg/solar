// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlockInsideUnchecked {
    function f() public pure returns (uint y) {
        unchecked {{
            uint max = type(uint).max;
            uint x = max + 1;
            y = x;
        }}
    }
}
