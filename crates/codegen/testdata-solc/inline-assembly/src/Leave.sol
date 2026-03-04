// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Leave {
    function f() public pure returns (uint w) {
        assembly {
            function f() -> t {
                t := 2
                leave
                t := 9
            }
            w := f()
        }
    }
}
