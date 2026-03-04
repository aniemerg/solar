// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

function fun(uint[] calldata _x, uint[] storage _y) view returns (uint, uint[] calldata) {
    return (_y[0], _x);
}

contract StorageCalldataRefs {
    uint[] data;

    function f(uint x, uint[] calldata input) public returns (uint, uint) {
        data.push(x);
        (uint a, uint[] calldata b) = fun(input, data);
        return (a, b[1]);
    }
}
