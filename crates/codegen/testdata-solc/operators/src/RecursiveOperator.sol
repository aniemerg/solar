// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type Uint is uint;
using {unaryCountdown as ~, binaryCountdown as ^, eq as ==} for Uint global;

function unaryCountdown(Uint x) pure returns (Uint) {
    if (x == Uint.wrap(0))
        return Uint.wrap(0);

    return ~Uint.wrap(Uint.unwrap(x) - 1);
}

function binaryCountdown(Uint x, Uint y) pure returns (Uint) {
    if (x == Uint.wrap(0) && y == Uint.wrap(0))
        return Uint.wrap(0);
    if (x == Uint.wrap(0))
        return y ^ x;

    return Uint.wrap(Uint.unwrap(x) - 1) ^ y;
}

function eq(Uint x, Uint y) pure returns (bool) {
    return Uint.unwrap(x) == Uint.unwrap(y);
}

contract C {
    function runUnary(Uint x) public pure returns (Uint) {
        return ~x;
    }

    function runBinary(Uint x, Uint y) public pure returns (Uint) {
        return x ^ y;
    }
}
