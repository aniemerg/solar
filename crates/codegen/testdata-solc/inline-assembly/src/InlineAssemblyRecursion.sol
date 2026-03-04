// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineAssemblyRecursion {
    function f(uint256 a) public returns (uint256 b) {
        assembly {
            function fac(n) -> nf {
                switch n
                    case 0 {
                        nf := 1
                    }
                    case 1 {
                        nf := 1
                    }
                    default {
                        nf := mul(n, fac(sub(n, 1)))
                    }
            }
            b := fac(a)
        }
    }
}
