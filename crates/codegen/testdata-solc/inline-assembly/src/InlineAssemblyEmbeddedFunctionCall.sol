// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineAssemblyEmbeddedFunctionCall {
    function f() public returns (uint, uint, uint, uint) {
        uint a1; uint b1; uint c1; uint d;
        assembly {
            let dv := 0x10

            function asmfun(a, b, c) -> x, y, z {
                x := g(a)
                function g(r) -> s {
                    s := mul(r, r)
                }
                y := g(b)
                z := 7
            }
            let a1v, b1v, c1v := asmfun(1, 2, 3)
            a1 := a1v
            b1 := b1v
            c1 := c1v
            d := dv
        }
        return (a1, b1, c1, d);
    }
}
