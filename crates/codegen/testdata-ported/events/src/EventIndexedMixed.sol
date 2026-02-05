// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventIndexedMixed {
    event E(uint256 a, uint256 indexed r, uint256 b, bytes c);

    function deposit() public {
        emit E(1, 2, 3, "def");
    }
}
