// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PackingSignedTypes {
    function run() public pure returns(int8 y) {
        uint8 x = 0xfa;
        return int8(x);
    }
}
