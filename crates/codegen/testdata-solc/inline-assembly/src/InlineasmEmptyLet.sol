// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineasmEmptyLet {
    function f() public pure returns (uint a, uint b) {
        assembly {
            let x
            let y, z
            a := x
            b := z
        }
    }
}
