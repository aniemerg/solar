// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlippingSignTests {
    function f() public returns (bool) {
        int256 x = -2 ** 255;
        unchecked {
            assert(-x == x);
        }
        return true;
    }
}
