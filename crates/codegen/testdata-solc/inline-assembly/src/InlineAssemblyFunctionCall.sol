// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineAssemblyFunctionCall {
    function f() public returns (uint, uint, uint) {
        uint a1; uint b1; uint c1;
        assembly {
            function asmfun(a, b, c) -> x, y, z {
                x := a
                y := b
                z := 7
            }
            let a1v, b1v, c1v := asmfun(1, 2, 3)
            a1 := a1v
            b1 := b1v
            c1 := c1v
        }
        return (a1, b1, c1);
    }
}
