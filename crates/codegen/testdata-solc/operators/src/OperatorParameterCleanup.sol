// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type U8 is uint8;
using {f as ~, add as +} for U8 global;

function f(U8 x) pure returns (U8 z) {
    assembly {
        z := div(x, 256)
    }
}

function add(U8 x, U8 y) pure returns (U8 z) {
    assembly {
        z := add(div(x, 256), div(x, 256))
    }
}

contract C {
    function testUnary() external pure returns (U8, U8) {
        U8 a;
        assembly {
            a := 0x4200
        }
        return (~a, f(a));
    }

    function testBinary() external pure returns (U8, U8) {
        U8 a;
        U8 b;
        assembly {
            a := 0x4200
            b := 0x4200
        }
        return (a + b, add(a, b));
    }
}
