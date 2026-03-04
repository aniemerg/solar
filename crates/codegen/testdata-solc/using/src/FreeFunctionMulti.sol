// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

function id(uint x) pure returns (uint) {
    return x;
}

function zero(uint) pure returns (uint) {
    return 0;
}

contract FreeFunctionMulti {
    function f(uint z) pure external returns(uint) {
        return z.id();
    }

    using {id, zero, zero, id} for uint;

    function g(uint z) pure external returns (uint) {
        return z.zero();
    }
}
