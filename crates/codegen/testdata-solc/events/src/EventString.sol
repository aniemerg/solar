// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventString {
    event E(string r);

    function deposit() public {
        emit E("HELLO WORLD");
    }
}
