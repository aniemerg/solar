// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventIndexedString {
    string x;
    uint256[4] y;
    event E(string indexed r, uint256[4] indexed t);

    function deposit() public {
        for (uint256 i = 0; i < 90; i++) bytes(x).push(0);
        for (uint8 i = 0; i < 90; i++) bytes(x)[i] = bytes1(i);
        y[0] = 4;
        y[1] = 5;
        y[2] = 6;
        y[3] = 7;
        emit E(x, y);
    }
}
