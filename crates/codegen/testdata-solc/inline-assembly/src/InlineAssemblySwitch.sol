// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineAssemblySwitch {
    function f(uint256 a) public returns (uint256 b) {
        assembly {
            switch a
                case 1 {
                    b := 8
                }
                case 2 {
                    b := 9
                }
                default {
                    b := 2
                }
        }
    }
}
