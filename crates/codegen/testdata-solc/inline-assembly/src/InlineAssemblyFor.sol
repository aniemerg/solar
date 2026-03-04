// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineAssemblyFor {
    function f(uint256 a) public returns (uint256 b) {
        assembly {
            function fac(n) -> nf {
                nf := 1
                for {
                    let i := n
                } gt(i, 0) {
                    i := sub(i, 1)
                } {
                    nf := mul(nf, i)
                }
            }
            b := fac(a)
        }
    }
}
