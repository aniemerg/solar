// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeleteLocal {
    function delLocal() public pure returns (uint res) {
        uint v = 5;
        delete v;
        res = v;
    }
}
